package com.example.model;

import java.util.List;

public class AbstractModel {
//    private List<T> listReSult;
    private Integer page;
    private Integer maxPageItem;
    private Integer totalItem;
    private Integer totalPage;
    private String sortBy;
    private String sortName;


//    public List<T> getListReSult() {
//        return listReSult;
//    }
//
//    public void setListReSult(List<T> listReSult) {
//        this.listReSult = listReSult;
//    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getMaxPageItem() {
        return maxPageItem;
    }

    public void setMaxPageItem(Integer maxPageItem) {
        this.maxPageItem = maxPageItem;
    }

    public Integer getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(Integer totalItem) {
        this.totalItem = totalItem;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }
}
