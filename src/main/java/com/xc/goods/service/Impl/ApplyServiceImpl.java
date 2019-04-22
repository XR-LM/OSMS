package com.xc.goods.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.goods.mapper.ApplyMapper;
import com.xc.goods.mapper.ArticleMapper;
import com.xc.goods.pojo.Apply;
import com.xc.goods.pojo.Article;
import com.xc.goods.service.ApplyService;
import com.xc.goods.util.ApplyQueryParams;
import com.xc.goods.util.ApplyResult;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 申请服务层
 */
@Service
@Transactional
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	private ApplyMapper applyMapper;
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Override
	public DataGridResult getApplyList(Integer pageNumber, 
			Integer pageSize,
			Integer articleType,
			String articleName,
			String userName,
			String date,
			Integer applystatus) {
		// 从page页开始，每页rows条数据,该方法会自动查询所有数据
		PageHelper.startPage(pageNumber, pageSize);
		
		ApplyQueryParams params =new ApplyQueryParams(userName, articleType, articleName, date, applystatus);
		//查询所有商品
		List<Apply> list=applyMapper.selectApplyList(params);
		//取分页信息
		PageInfo<Apply> pageInfo = new PageInfo<>(list);
		//创建返回结果对象
		DataGridResult result = new DataGridResult();
		result.setTotal((int) pageInfo.getTotal());
		result.setRows(list);

		return result;
	}

	@Override
	public Result validApplyNum(Long num, Long id) {
		//根据id查询办公用品
		Article article = articleMapper.selectByPrimaryKey(id);
		
		if(article==null)
			return  Result.build(400, "错误");
		if(num>article.getStockNum()) {
			return Result.build(400, "申请数量超过库存数量");
		}
		
		
	
		return Result.ok();
	}
	/**0 审核中
	 * 1 审核通过
	 * -1 驳回
	 * 2 撤回
	*/
	@Override
	public Result insertApply(Apply apply) {
		
		apply.setApplyState(0);
		int i = applyMapper.insert(apply);
		if(i==1) {
			//修改办公用品中的库存数量
			//获取id
			Long articleId = apply.getArticleId();
			//根据id查询办公用品
			Article article = articleMapper.selectByPrimaryKey(articleId);
			//更新数量
			article.setStockNum(article.getStockNum()-Long.valueOf(apply.getApplyNum()));
			//执行更新
			articleMapper.updateByPrimaryKey(article);
			return Result.ok();
		}else {
			return Result.build(400, "申请失败");
		}
	}

	/**
	 * 撤回申请
	 * @param applyid
	 * @return
	 */
	@Override
	public Result updateApplyById(Long applyid) {

		//查询申请信息
		Apply apply = applyMapper.selectByPrimaryKey(applyid);

		//修改库存数量
		Article article = articleMapper.selectByPrimaryKey(apply.getArticleId());

		article.setStockNum(article.getStockNum()+Long.parseLong(apply.getApplyNum()));

		//更新办公用品表
		int i = articleMapper.updateByPrimaryKey(article);

		if(i!=1)
			return Result.build(400, "撤回申请失败");

		//更改申请状态为撤回状态
		apply.setApplyState(2);

		int j = applyMapper.updateByPrimaryKey(apply);

		if(j!=1)
			return Result.build(400, "撤回申请失败");

		return Result.ok();
	}


	/**
	 * 批量撤回申请
	 * @param ids
	 * @return
	 */
	@Override
	public Result undoApply(String ids) {
		
		String[] id = ids.split(",");
	
		//osms
		//将字符串类型的ids转换为Long类型
		for (String string : id) {
			long applyid = Long.parseLong(string);
			Apply apply = applyMapper.selectByPrimaryKey(applyid);
			
			//判断是否是审核中状态
			if(apply.getApplyState()!=0)
				return Result.build(400, "当前状态不能撤回！");
			
			//更新申请表中办公用品状态
			apply.setApplyState(2);
			int i = applyMapper.updateByPrimaryKey(apply);
			if(i!=1) {
				return Result.build(400, "删除失败！");
			}
			
			//修改办公用品中的库存数量
			//获取id
			Long articleId = apply.getArticleId();
			//根据id查询办公用品
			Article article = articleMapper.selectByPrimaryKey(articleId);
			//更新数量
			article.setStockNum(article.getStockNum()+Long.valueOf(apply.getApplyNum()));
			//执行更新
			articleMapper.updateByPrimaryKey(article);
			
		}
		return Result.build(200, "撤回申请成功");
	}

	/**
	 * 重新申请
	 * @param id
	 * @return
	 */
	@Override
	public Result reapply(Long id) {
		// TODO 自动生成的方法存根
		
		//判断申请数量是否超过库存数量
		Apply apply = applyMapper.selectByPrimaryKey(id);
		Long articleId = apply.getArticleId();
		Result result = validApplyNum(Long.valueOf(apply.getApplyNum()), articleId);
		if(result.getStatus()==400)
			return Result.build(400, "申请数量超过库存数量");
		
		//重新设置申请状态
		apply.setApplyState(0);
		int i = applyMapper.updateByPrimaryKey(apply);
		if(i!=1) {
			return Result.build(400, "重新申请失败！");
		}
		
		//修改办公用品中的库存数量
		//根据id查询办公用品
		Article article = articleMapper.selectByPrimaryKey(articleId);
		//更新数量
		article.setStockNum(article.getStockNum()-Long.valueOf(apply.getApplyNum()));
		//执行更新
		articleMapper.updateByPrimaryKey(article);
		
		
		return Result.ok();
	}

	/**
	 * 通过申请
	 * @param id
	 * @return
	 */
	@Override
	public Result applyok(Long id) {
		//判断申请数量是否超过库存数量
		Apply apply = applyMapper.selectByPrimaryKey(id);
		//重新设置申请状态
		apply.setApplyState(1);
		int i = applyMapper.updateByPrimaryKey(apply);
		if(i!=1) {
			return Result.build(400, "重新申请失败！");
		}
		return Result.ok();
	}

	/**
	 * 驳回申请
	 * @param id
	 * @return
	 */
	@Override
	public Result applyrej(Long id) {
		Apply apply = applyMapper.selectByPrimaryKey(id);

		//修改库存数量
		Article article = articleMapper.selectByPrimaryKey(apply.getArticleId());

		article.setStockNum(article.getStockNum()+Long.parseLong(apply.getApplyNum()));

		//更新办公用品表
		int i = articleMapper.updateByPrimaryKey(article);

		if(i!=1)
			return Result.build(400, "申请失败");
				
		
		//重新设置申请状态
		apply.setApplyState(-1);
		int j = applyMapper.updateByPrimaryKey(apply);
		if(j!=1) {
			return Result.build(400, "驳回申请失败！");
		}
		return Result.ok();
	}

	/**
	 * 查询申请
	 * @param id 申请id
	 * @return
	 */
	@Override
	public ApplyResult findApplyById(Long id) {
		
		ApplyResult apply = applyMapper.selectApplyQueryParams(id);
		
		if(apply!=null)
			return apply;
		
		return null;
	}

	/**
	 * 批量驳回申请
	 * @param ids
	 * @return
	 */
	@Override
	public Result applyrejects(String ids) {
		String[] id = ids.split(",");
		for (String string : id) {
			Result applyrej = applyrej(Long.parseLong(string));
			if(applyrej.getStatus()==400)
				return applyrej;
		}
		return Result.ok();
	}

	/**
	 * 批量通过申请
	 * @param ids
	 * @return
	 */
	@Override
	public Result applyapplyoks(String ids) {
		String[] id = ids.split(",");
		for (String string : id) {
			Result applyok = applyok(Long.parseLong(string));
			if(applyok.getStatus()==400)
				return applyok;
		}
		return Result.ok();
	}

	/**
	 * 修改申请
	 * @param applyid 申请id
	 * @param num 申请数量
	 * @return
	 */
	@Override
	public Result modifyApply(Long applyid, Long num) {
		//查询申请信息
		Apply apply = applyMapper.selectByPrimaryKey(applyid);

		//修改库存数量
		Article article = articleMapper.selectByPrimaryKey(apply.getArticleId());

		article.setStockNum(article.getStockNum()-num);

		//更新办公用品表
		int i = articleMapper.updateByPrimaryKey(article);

		if(i!=1)
			return Result.build(400, "申请失败");

		//重新设置申请表中的申请数量
		apply.setApplyNum(num+"");

		//更改申请状态为审核中
		apply.setApplyState(0);

		int j = applyMapper.updateByPrimaryKey(apply);

		if(j!=1)
			return Result.build(400, "申请失败");

		return Result.ok();
	}

}
