package com.xc.goods.pojo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Apply {
    private Long id;

    private Long userId;

    private Long articleId;

    private String applyNum;

    private Integer applyUnit;

    private String applyDate;

    private Integer applyState;

    private String applyReason;
    
    //一个申请对应一个申请人
    private User user;
    
    //一个申请对应一个物品
    private Article article;
    
    public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Long getId() {
        return id;
    }

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getApplyNum() {
        return applyNum;
    }

    public void setApplyNum(String applyNum) {
        this.applyNum = applyNum == null ? null : applyNum.trim();
    }

    public Integer getApplyUnit() {
        return applyUnit;
    }

    public void setApplyUnit(Integer applyUnit) {
        this.applyUnit = applyUnit;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate == null ? null : applyDate.trim();
    }

    public Integer getApplyState() {
        return applyState;
    }

    public void setApplyState(Integer applyState) {
        this.applyState = applyState;
    }
    
    public void setApplyReason(String applyReason) {
        this.applyReason = applyReason == null ? null : applyReason.trim();
    }
    public String getApplyReason() {
        return applyReason;
    }
    //重写articlename
    @JsonProperty
    public String getArticleName1() {
        return article.getArticleName()==null?null:article.getArticleName();
    }
    //重写办公用品单位
    public String getStockUnit1() {
        return article.getStockUnit()==null?null:article.getStockUnit();
    }
    
    //重写办公用品类别
    public String getArticleType1() {
    	if(article.getArticleType1()!=null)
    		return article.getArticleType1();
    	return null;
    }
    //重写办申请人
    public String getuserName() {
    	if(user.getUserName()!=null)
    		return user.getUserName();
        return user.getUserName();
    }

	/**0 审核中
	 * 1 审核通过
	 * -1 驳回
	 * 2 撤回
	*/
    //重写申请类型类型
    public String getApplyState1() {
    	String type="";
    	switch (applyState) {
			case 0: type="审核中";break;
			case 1: type="审核通过";break;
			case -1: type="驳回";break;
			case 2: type="撤回";break;
	}
        return type;
    }
   
}