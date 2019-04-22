package com.xc.goods.pojo;

public class Article {
    private Long id;

    private String articleName;

    private Long stockNum;

    private String stockUnit;
    /**
     * 商品类型
     * 1 笔
     * 2 笔记本
     * 3 订书机
     * 4 打印纸
     * 5 订书针
     * 6 文件夹
     * 7 档案袋
     */
    private Integer articleType;
    
    private String articleDescribe;

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
        this.articleName = articleName == null ? null : articleName.trim();
    }

    public Long getStockNum() {
        return stockNum;
    }

    public void setStockNum(Long stockNum) {
        this.stockNum = stockNum;
    }

    public String getStockUnit() {
        return stockUnit;
    }

    public void setStockUnit(String stockUnit) {
        this.stockUnit = stockUnit == null ? null : stockUnit.trim();
    }
   
    /* 1 笔
    * 2 笔记本
    * 3 订书机
    * 4 打印纸
    * 5 订书针
    * 6 文件夹
    * 7 档案袋
    */
    public Integer getArticleType() {
        return articleType;
    }
    //返回字符串类型的文件类别类别
    public String getArticleType1() {
    	String type="";
    	switch (articleType) {
			case 1: type="笔";break;
			case 2: type="笔记本";break;
			case 3: type="订书机";break;
			case 4: type="打印纸";break;
			case 5: type="订书针";break;
			case 6: type="文件夹";break;
			case 7: type="档案袋";break;
    	}
        return type;
    }
    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    public String getArticleDescribe() {
        return articleDescribe;
    }

    public void setArticleDescribe(String articleDescribe) {
        this.articleDescribe = articleDescribe == null ? null : articleDescribe.trim();
    }
}