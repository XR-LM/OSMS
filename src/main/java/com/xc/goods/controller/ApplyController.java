package com.xc.goods.controller;

import com.xc.goods.pojo.Apply;
import com.xc.goods.pojo.User;
import com.xc.goods.service.ApplyService;
import com.xc.goods.util.ApplyResult;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 申请物品
 * @author Administrator
 *
 */
@Controller
@RequestMapping("apply")
public class ApplyController {
	
	@Autowired
	private ApplyService applyService;


	/**
	 * 跳转到申请信息页面
	 * @return
	 */
	@RequestMapping("")
	public String toApplyPage() {
		return "apply";
	}
	
	/**
	 * 跳转至新增申请表单页面
	 * @return
	 */
	@RequestMapping("add")
	public String toNewApplyPage() {
		return "apply_add";
	}
	/**
	 * 跳转至申请编辑页面页面
	 * @return
	 */
	@RequestMapping("edit")
	public String toApplyEditPage() {
		return "apply_edit";
	}
	/**
	 * 跳转到新增申请table页面
	 * @return
	 */          
	@RequestMapping("enableapplylist")
	public String toEnableApplyPage() {
		return "apply_new";
	}

	/**
	 * 根据不同的条件查询，返回带分页的结果
	 * @param pageNumber  当前页数
	 * @param pageSize    每页记录数
	 * @param goodstype   办公用品类别
	 * @param goodsname   办公用品名称
	 * @param username    申请人姓名
	 * @param applydate   申请日期
	 * @param applystatus 申请状态
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public DataGridResult getAppyList (@RequestParam(defaultValue = "1") Integer pageNumber,
									  Integer pageSize,
									  Integer goodstype,
									  String goodsname,
									  String username,
									  String applydate,
									  Integer applystatus, HttpServletRequest request) {

		String path = request.getHeader("Referer");
		//普通员工查询自己的申请
		if(path.indexOf("%E7%94%B3%E8%AF%B7%E5%AE%A1%E6%A0%B8.html")==-1){
			username=((User)request.getSession().getAttribute("user")).getUserName();
		}
		//管理员查询所有申请
		DataGridResult result=applyService.getApplyList(pageNumber, pageSize,goodstype,
				goodsname,username,applydate,applystatus);
		return result;
	}
	
	
	/*
	 * 申请数量校验
	 */
	@RequestMapping("validNum")
	@ResponseBody
	public Result validApplyNum(Long num,Long id) {
		Result result=applyService.validApplyNum(num,id);
		return result;
	}


	/**
	 * 添加申请
	 * @param apply
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	public Result insertApply(Apply apply) {
		Result result=applyService.insertApply(apply);
		return result;
	}

	/**
	 * 撤回申请
	 * @param applyid
	 * @return
	 */
	@RequestMapping("update/{applyid}")
	@ResponseBody
	public Result updateApplyById(@PathVariable Long applyid) {
		Result result=applyService.updateApplyById(applyid);
		return result;
	}

	/*
	 * 批量撤回申请
	 */
	@RequestMapping("undo")
	@ResponseBody
	public Result undoApply(String ids) {
		Result result=applyService.undoApply(ids);
		return result;
	}
	
	/*
	 * 重新申请
	 */
	@RequestMapping("reapply")
	@ResponseBody
	public Result reapply(Long id) {
		Result result=applyService.reapply(id);
		return result;
	}
	/*
	 * 通过申请
	 */
	@RequestMapping("ok")
	@ResponseBody
	public Result applyok(Long id) {
		Result result=applyService.applyok(id);
		return result;
	}
	/*
	 * 驳回申请
	 */
	@RequestMapping("rej")
	@ResponseBody
	public Result applyrej(Long id) {
		Result result=applyService.applyrej(id);
		return result;
	}
	
	/*
	 * 批量驳回申请
	 */
	@RequestMapping("rejs")
	@ResponseBody
	public Result applyrejects(String ids) {
		Result result=applyService.applyrejects(ids);
		return result;
	}
	
	
	/*
	 * 批量通过申请
	 */
	@RequestMapping("oks")
	@ResponseBody
	public Result applyapplyoks(String ids) {
		
		Result result=applyService.applyapplyoks(ids);
		return result;
	}
	/**
	 * 根据id查询申请
	 * @param id
	 * @return
	 */
	@RequestMapping("/{id}")
	@ResponseBody
	public ApplyResult findApplyById(@PathVariable Long id) {
		ApplyResult apply=applyService.findApplyById(id);
		return apply;
	}


	/**
	 * 修改申请
	 * @return
	 */
	@RequestMapping("modify/{applyid}/{num}")
	@ResponseBody
	public Result modifyApply(@PathVariable Long applyid,@PathVariable Long num) {
		Result result=applyService.modifyApply(applyid,num);
		return result;
	}

}
