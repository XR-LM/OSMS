package com.xc.goods.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.goods.mapper.ArticleMapper;
import com.xc.goods.pojo.Article;
import com.xc.goods.pojo.ArticleExample;
import com.xc.goods.pojo.ArticleExample.Criteria;
import com.xc.goods.service.GoodsService;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 办公用品管理
 * @author Administrator
 *
 */
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public DataGridResult getGoodsList(Integer pageNumber, Integer pageSize, Integer goodstype, String goodsname) {
		// 从page页开始，每页rows条数据,该方法会自动查询所有数据
		PageHelper.startPage(pageNumber, pageSize);
		//创建example对象
		ArticleExample example = new ArticleExample();
		
		
		//创建离线查询对象
		Criteria createCriteria = example.createCriteria();
		
		//判断是否输入查询条件
		if(goodsname!=null&&!"".equals(goodsname)&&!"物品名称".equals(goodsname)) {
			//根据姓名模糊查询
			createCriteria.andArticleNameLike("%"+goodsname+"%");
		}
		if(goodstype!=null&&goodstype!=0) {
			//根据姓名模糊查询
			createCriteria.andArticleTypeEqualTo(goodstype);
		}
		//查询所有商品
		List<Article> list=articleMapper.selectByExample(example);
		//取分页信息
		PageInfo<Article> pageInfo = new PageInfo<>(list);
		//创建返回结果对象
		DataGridResult result = new DataGridResult();
		result.setTotal((int) pageInfo.getTotal());
		result.setRows(list);
				
		return result;
	}

	@Override
	public Result valideGoodsName(String name,String id ) {
		//创建example对象
		ArticleExample example = new ArticleExample();
		
		
		//创建离线查询对象
		Criteria createCriteria = example.createCriteria();
		
		//判断是否输入查询条件
		if(name!=null&&!"".equals(name)&&!"请输入标题".equals(name)) {
			createCriteria.andArticleNameEqualTo(name);
		}
		//排除id本身
		if(id!=null){
			createCriteria.andIdNotEqualTo(Long.parseLong(id));
		}
		//查询所有商品
		List<Article> list=articleMapper.selectByExample(example);
		//取分页信息
		if(list==null||list.size()==0) {
			return Result.ok();
		}else {
			return Result.build(400, "商品已存在");
		}
	}

	@Override
	public Result addGoods(Article article) {

		int i = articleMapper.insert(article);
		if(i!=0) {
			return Result.ok();
		}else {
			return Result.build(400, "添加失败");
		}
	}

	@Override
	public Result deleteGoodsById(String ids) {
		String[] id = ids.split(",");
		
		List<Long> list =new ArrayList<Long>();
		//将字符串类型的ids转换为Long类型
		for (String string : id) {
			long id1 = Long.parseLong(string);
			Article article = articleMapper.selectByPrimaryKey(id1);
			article.setStockNum((long) 0);
			int i = articleMapper.updateByPrimaryKey(article);
			if(i!=1) {
				return Result.build(400, "删除失败！");
			}
		}
	
		
		return Result.build(200, "删除成功！");
	}

	@Override
	public Article findGoodsById(Long id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		return article;
	}

	@Override
	public Result modGoodsById(Article article) {
		int i = articleMapper.updateByPrimaryKeyWithBLOBs(article);
		if(i==1) {
			return Result.ok();
		}else {
			return Result.build(400, "修改失败！");
		}
	}	

}
