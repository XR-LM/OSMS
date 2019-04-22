package com.xc.goods.util;
/**
 * 查询参数
 * @author Administrator
 *
 */
public class ApplyQueryParams {
	
	//用户姓名
	 private String userName;
	
	//办公用品类别
	private Integer articleType;
	
	//办公用品名称
	private String articleName;
	
	//申请日期
	private String applyDate;
	
	//申请状态
	private Integer applyState;
	


	public Integer getApplyState() {
		return applyState;
	}

	public void setApplyState(Integer applyState) {
		this.applyState = applyState;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getArticleType() {
		return articleType;
	}

	public void setArticleType(Integer articleType) {
		this.articleType = articleType;
	}

	public String getArticleName() {
		return articleName;
	}

	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}

	public ApplyQueryParams(String userName, Integer articleType, String articleName, String applyDate,
			Integer applyState) {
		super();
		this.userName = userName;
		this.articleType = articleType;
		this.articleName = articleName;
		this.applyDate = applyDate;
		this.applyState = applyState;
	}
	
}
