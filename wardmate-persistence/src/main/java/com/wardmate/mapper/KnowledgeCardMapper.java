package com.wardmate.mapper;

import com.wardmate.model.KnowledgeCard;

import java.util.HashMap;
import java.util.List;

public interface KnowledgeCardMapper {
    //分页查询分为两个子查询动作，结果总数+一个页面的内容，最终封装返回
    //1.查询某个条件下的总行数，参数使用HashMap封装
    Integer queryRowCount(HashMap<String,Object> conditions);
    List<KnowledgeCard> queryTargetPage(HashMap<String,Object> conditions);
}
