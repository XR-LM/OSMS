package com.xc.goods.util;
/**
 * 申请办公用品辅助接受数据类
 * @author Administrator
 *
 */
public class ApplyResult {

	
	private Long id;
	private String articleName;
	private Integer articleType;
	private String applyDate;
	private String applyName;
	private String stockUnit;
	private String applyReason;
	private String applyNum;
	public String getApplyName() {
		return applyName;
	}
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}

	
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}
	//商品id
	private Long articleId;
	
	public Long getArticleId() {
		return articleId;
	}
	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public Integer getArticleType() {
		return articleType;
	}
	public void setArticleType(Integer articleType) {
		this.articleType = articleType;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getStockUnit() {
		return stockUnit;
	}
	public void setStockUnit(String stockUnit) {
		this.stockUnit = stockUnit;
	}
	public String getApplyReason() {
		return applyReason;
	}
	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	
	
	
}
