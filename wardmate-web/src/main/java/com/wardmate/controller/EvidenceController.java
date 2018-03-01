package com.wardmate.controller;

import com.wardmate.model.Evidence;
import com.wardmate.serviceInterface.IEvidenceService;
import com.wardmate.vo.EvidenceQueryObject;
import com.wardmate.vo.EvidenceQueryResult;
import com.wardmate.vo.SimpleQueryObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
@RequestMapping("/evidence")
public class EvidenceController {
    private Logger logger = LogManager.getLogger();
    //下述3个变量用于页面显示
    private static Map<Integer,String> searchFieldMap = new HashMap<>();
    private static Map<Integer,String> yearMap = new HashMap<>();
    private static SimpleQueryObject simpleQueryObject = new SimpleQueryObject();
    private static EvidenceQueryResult queryResult = new EvidenceQueryResult();

    @Autowired
    private IEvidenceService evidenceService;

    EvidenceController(){
        //这里隐藏了一些支持检索字段，内容较少且面向非专业用户，不必太复杂
        searchFieldMap.put(1,"全 部");searchFieldMap.put(2,"标 题");searchFieldMap.put(3,"关 键 词");searchFieldMap.put(4,"摘 要");
        yearMap.put(0,"全部");yearMap.put(5,"近五年");yearMap.put(3,"近三年");
        //筛选方案
        //typeList.add("全部");typeList.add("临床指南");typeList.add("系统评价");typeList.add("药物信息");typeList.add("卫生技术评估");
        //typeList.add("百科知识");typeList.add("患者手册");typeList.add("多媒体资料");typeList.add("网站资讯");
    }

    @RequestMapping("/index")
    public String gotoIndex(ModelMap modelMap){
        return "/evidence/index";
    }

    @RequestMapping("/queryEvidence")
    public String queryEvidence(SimpleQueryObject newSimpleQueryObject, ModelMap modelMap){
        simpleQueryObject = newSimpleQueryObject;
        EvidenceQueryObject queryObject = new EvidenceQueryObject();
        String searchTerm = simpleQueryObject.getSearchTerm();
        switch (simpleQueryObject.getFieldCode()){
            case 1:
                queryObject.setAllField(searchTerm);
                break;
            case 2:
                queryObject.setTitle(searchTerm);
                break;
            case 3:
                if(searchTerm.equals("慢病")){
                    searchTerm = ",";
                }
                queryObject.setKeywords(searchTerm);
                break;
            case 4:
                queryObject.setSummary(searchTerm);
                break;
            default:
                logger.info("wrong fieldCode");
                break;
        }
        Integer totalResultCount = evidenceService.getTotalResultCount(queryObject);
        logger.info("totalResultCount:"+totalResultCount);
        List<Evidence> evidences = evidenceService.queryEvidence(queryObject);
        //简单检索产生的证据类型集合，用于筛选内容
        List<String> evidenceTypes = evidenceService.getEvidenceTypes(queryObject);

        queryResult.setTotalResultCount(totalResultCount);
        queryResult.setEvidenceTypes(evidenceTypes);
        queryResult.setEvidences(evidences);
        modelMap.put("queryResult",queryResult);
        modelMap.put("simpleQueryObject",simpleQueryObject);
        modelMap.put("queryObject",queryObject);
        return "/evidence/search";
    }

    @RequestMapping("/screenEvidence")
    public String screenEvidence(EvidenceQueryObject queryObject, ModelMap modelMap){
        logger.info(queryObject);
        Integer totalResultCount = evidenceService.getTotalResultCount(queryObject);
        //使用@ModelAttribute可以将接收到的EvidenceQueryObject自动更新到request/modelMap中
        List<Evidence> evidences = evidenceService.queryEvidence(queryObject);

        queryResult.setTotalResultCount(totalResultCount);
        //使用简单查询的结果，不必再次从数据库中查找
        // queryResult.setEvidenceTypes(evidenceTypes);
        queryResult.setEvidences(evidences);
        modelMap.put("queryResult",queryResult);
        modelMap.put("simpleQueryObject",simpleQueryObject);
        modelMap.put("queryObject",queryObject);
        return "/evidence/search";
    }
    @RequestMapping("/getContent/{contentId}")
    public String getContent(@PathVariable("contentId") String contentId,ModelMap modelMap){
        modelMap.put("contentId",contentId);
        return "/evidence/content";
    }

    @ModelAttribute("simpleQueryObject")
    public void prepareConditions(ModelMap modelMap){
        modelMap.put("searchFieldMap",searchFieldMap);
        modelMap.put("simpleQueryObject",new SimpleQueryObject());
        modelMap.put("yearMap",yearMap);
    }
}
