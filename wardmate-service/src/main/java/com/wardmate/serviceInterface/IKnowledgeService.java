package com.wardmate.serviceInterface;

import com.wardmate.model.KnowledgeCard;
import com.wardmate.vo.PageQueryResult;

import java.util.HashMap;
import java.util.List;

public interface IKnowledgeService {
    PageQueryResult queryCardByConditions(HashMap<String,Object> conditionMap);
    List<KnowledgeCard> queryCardForJson(HashMap<String,Object> conditionMap);
}
