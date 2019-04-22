package com.xc.goods.service;

import com.xc.goods.pojo.Apply;
import com.xc.goods.util.ApplyResult;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;

/**
 * 申请商品接口
 * @author Administrator
 *
 */
public interface ApplyService {
	/**
	 * 查询办公用品
	 * @param pageNumber  当前页数
	 * @param pageSize    每页记录数
	 * @param goodstype   办公用品类别
	 * @param goodsname   办公用品名称
	 * @param userName    申请人姓名
	 * @param date        申请日期
	 * @param applystatus 申请状态
	 * @return
	 */
	DataGridResult getApplyList(Integer pageNumber, 
			Integer pageSize,
			Integer goodstype,
			String goodsname,
			String userName,
			String date,
			Integer applystatus);
	/**
	 * 验证数量
	 * @param num
	 * @param id
	 * @return
	 */
	Result validApplyNum(Long num, Long id);
	/**
	 * 新增申请
	 * @param article
	 * @return
	 */
	Result insertApply(Apply apply);
	/**
	 * 撤回申请
	 * @param ids
	 * @return
	 */
	Result undoApply(String ids);
	/**
	 * 重新申请
	 * @param id
	 * @return
	 */
	Result reapply(Long id);
	/**
	 * 通过申请
	 * @param id
	 * @return
	 */
	Result applyok(Long id);
	/**
	 * 驳回申请
	 * @param id
	 * @return
	 */
	Result applyrej(Long id);
	/**
	 * 查询申请
	 * @param id 申请id
	 * @return
	 */
	ApplyResult findApplyById(Long id);

	/**
	 * 
	 * 撤回申请
	 * @param applyid 申请id
	 * @return
	 */
	Result updateApplyById(Long applyid);
	
	/**
	 * 批量驳回申请
	 * @param ids
	 * @return
	 */
	Result applyrejects(String ids);

	/**
	 * 批量申请
	 * @param ids
	 * @return
	 */
	Result applyapplyoks(String ids);

	/**
	 * 修改申请
	 * @param applyid 申请id
	 * @param num 申请数量
	 * @return
	 */
	Result modifyApply(Long applyid, Long num);
}
