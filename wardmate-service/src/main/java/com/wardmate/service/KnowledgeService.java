package com.wardmate.service;

import com.wardmate.mapper.KnowledgeCardMapper;
import com.wardmate.model.KnowledgeCard;
import com.wardmate.serviceInterface.IKnowledgeService;
import com.wardmate.vo.PageQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class KnowledgeService implements IKnowledgeService {
    @Autowired
    private KnowledgeCardMapper cardDao;

    public PageQueryResult queryCardByConditions(HashMap<String,Object> conditionMap){
        Integer recordCount = cardDao.queryRowCount(conditionMap);
        List<Object> objects = new ArrayList<>();
        //有内容时才会进行分页查询
        if(recordCount > 0){
            //添加分页条件:根据pageSize pageIndex 计算 跳过的记录数 和 要查询的数量
            List<KnowledgeCard> knowledgeCards = cardDao.queryTargetPage(conditionMap);
            //不能直接向List<Object>赋值List<POJO>,但可以通过遍历添加
            knowledgeCards.stream().forEach(card -> objects.add(card));
        }
        PageQueryResult queryResult = new PageQueryResult();
        queryResult.setPageIndex((Integer) conditionMap.get("pageIndex"));
        queryResult.setRecordCount(recordCount);
        queryResult.setPageSize((Integer) conditionMap.get("pageSize"));
        queryResult.setRecordList(objects);
        return queryResult;
    }
    //json请求使用的方法,不需要封装PageQueryResult
    public List<KnowledgeCard> queryCardForJson(HashMap<String,Object> conditionMap){
        return cardDao.queryTargetPage(conditionMap);
    }
}
