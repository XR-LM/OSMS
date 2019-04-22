package com.xc.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 页面跳转控制层
 * @author Administrator
 *
 */
@Controller
public class PageController {
	
	@RequestMapping("/index")
	public String toIndex() {
		return "index";
	}

	/**
	 * 跳转到申请审核页面
	 * @return
	 */
	@RequestMapping("申请审核")
	public String toApplyVerPage() {
		return "申请审核";
	}
	
}
