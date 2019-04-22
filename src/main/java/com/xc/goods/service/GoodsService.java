package com.xc.goods.service;

import com.xc.goods.pojo.Article;
import com.xc.goods.util.DataGridResult;
import com.xc.goods.util.Result;

/**
 * 物品管理服务层
 * @author Administrator
 *
 */
public interface GoodsService {
	/**
	 * 查询办公用品
	 * @param pageNumber 当前页数
	 * @param pageSize  每页记录数
	 * @param goodstype 办公用品类别
	 * @param goodsname 办公用品名称
	 * @return
	 */
	DataGridResult getGoodsList(Integer pageNumber, Integer pageSize,Integer goodstype,
			String goodsname);
	/**
	 * 验证名称是否重复
	 * @param name 办公用品名称
	 * @return
	 */
	Result valideGoodsName(String name,String id);
	/**
	 *  添加办公用品
	 * @param article 办公用品对象
	 * @return
	 */
	Result addGoods(Article article);
	/**
	 * 
	 * @param ids 办公用品id
	 * @return
	 */
	Result deleteGoodsById(String ids);
	
	/**
	 * 根据id查询办公用品
	 * @param id
	 * @return
	 */
	Article findGoodsById(Long id);
	/**
	 * 修改办公用品信息
	 * @param article
	 * @return
	 */
	Result modGoodsById(Article article);
}
