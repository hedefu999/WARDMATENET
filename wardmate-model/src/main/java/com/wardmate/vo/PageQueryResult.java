package com.wardmate.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PageQueryResult implements Serializable{
    //查询结果
    private int recordCount;
    //用于封装查询结果实体类，可使用两种方式封装
    private List<Object> recordList = new ArrayList<>();
    private List<Map<String, Object>> recordMapList = new ArrayList<>();

    private int pageSize = -1;
    private int pageIndex = 1;


    //依据总行数rowCount、pageSize计算分页数量
    public Integer getPageCount(){
        if(this.pageSize > 0){
            //rowCount记录查询结果行数，从1开始计数，需要 - 1
            return (Integer)((this.recordCount - 1)/this.pageSize) + 1;
        }else {
            return -1;
        }
    }


    public int getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    public List<Object> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<Object> recordList) {
        this.recordList = recordList;
    }

    public List<Map<String, Object>> getRecordMapList() {
        return recordMapList;
    }

    public void setRecordMapList(List<Map<String, Object>> recordMapList) {
        this.recordMapList = recordMapList;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }
}
