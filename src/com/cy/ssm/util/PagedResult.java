package com.cy.ssm.util;

import java.util.List;

import com.cy.ssm.dto.BaseEntity;
 
/**
 * 功能概要：
 * 
 * @author linbingwen
 * @since  2015年10月23日 
 */
public class PagedResult<t> extends BaseEntity {
     
    /*serialVersionUID*/
    private static final long serialVersionUID = 1L;
 
    private List<t> dataList;//数据
     
    private long pageNo;//当前页
     
    private long pageSize;//条数
     
    private long total;//总条数
     
    private long pages;//总页面数目
 
    public List<t> getDataList() {
        return dataList;
    }
 
    public void setDataList(List<t> dataList) {
        this.dataList = dataList;
    }
 
    public long getPageNo() {
        return pageNo;
    }
 
    public void setPageNo(long pageNo) {
        this.pageNo = pageNo;
    }
 
    public long getPageSize() {
        return pageSize;
    }
 
    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }
 
    public long getTotal() {
        return total;
    }
 
    public void setTotal(long total) {
        this.total = total;
    }
 
    public long getPages() {
        return pages;
    }
 
    public void setPages(long pages) {
        this.pages = pages;
    }
     
}