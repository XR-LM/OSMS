package com.xc.goods.controller;


import com.xc.goods.pojo.Article;
import com.xc.goods.service.GoodsService;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 办公物品管理表现层
 * @author Administrator
 *
 */
@Controller
public class ArticleController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(path = {"goods","办公用品管理"})
	public String toGoodsPage() {
		return "办公用品管理";
	}
	@RequestMapping("新增办公用品")
	public String toGoodsAddPage() {
		return "新增办公用品";
	}
	
	@RequestMapping("article_edit")
	public String toGoodsEditPage() {
		return "article_edit";
	}


	/**
	 * 查询所有办公用品信息返回带有分页的json对象
	 * @param pageNumber 当前页码
	 * @param pageSize   每页记录数
	 * @param goodstype  办公用品类别
	 * @param goodsname  办公用品名称
	 * @return
	 */
	@RequestMapping("goods/list")
	@ResponseBody
	public DataGridResult getGoodsList(@RequestParam(defaultValue = "1") Integer pageNumber,
			Integer pageSize,
			Integer goodstype,
			String goodsname) {
		DataGridResult result=goodsService.getGoodsList(pageNumber, pageSize,goodstype,
				goodsname);
		return result;
	}
	
	/*
	 * 验证办公用品名称是否相同
	 */
	@RequestMapping("goods/namevalide")
	@ResponseBody
	public Result valideName(
			String name,String id) {
		Result result=goodsService.valideGoodsName(name,id);
		return result;
	}
	
	/*
	 * 添加办公用品
	 */
	@RequestMapping("goods/add")
	@ResponseBody
	public Result addGoods(Article article) {
		Result result=goodsService.addGoods(article);
		return result;
	}
	/**
	 *   根据id删除办公用品
	 * @param ids
	 * @return
	 */
	@RequestMapping("goods/delete")
	@ResponseBody
	public Result deleteGoods(String ids) {
		Result result=goodsService.deleteGoodsById(ids);
		return result;
	}
	
	/**
	 *   根据id查询办公用品
	 * @param ids
	 * @return
	 */
	@RequestMapping("goods/findbyid")
	@ResponseBody
	public Article queryGoodsById(Long id) {
		Article result=goodsService.findGoodsById(id);
		return result;
	}
	
	/**
	 *  修改办公用品信息
	 * @param ids
	 * @return
	 */
	@RequestMapping("goods/update")
	@ResponseBody
	public Result modifyGoodsById(Article article) {
		Result result=goodsService.modGoodsById(article);
		return result;
	}
}
