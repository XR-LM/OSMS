package com.xc.goods.util;

import java.util.List;

/**
 * 翻页辅助类
 * @author XR
 *
 */
public class DataGridResult{
	//总记录数
    private Integer total;
    //每页记录
    private List<?> rows;
    
    
    public DataGridResult(Integer total, List<?> rows) {
        this.total = total;
        this.rows = rows;
    }
    public DataGridResult(){}

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

}