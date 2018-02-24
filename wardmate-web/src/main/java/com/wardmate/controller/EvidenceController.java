package com.wardmate.controller;

import com.wardmate.model.Evidence;
import com.wardmate.serviceInterface.IEvidenceService;
import com.wardmate.vo.EvidenceQueryObject;
import com.wardmate.vo.SimpleQueryObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
@RequestMapping("/evidence")
public class EvidenceController {
    private Logger logger = LogManager.getLogger();

    private static Map<Integer,String> searchFieldMap = new HashMap<>();
    private static Map<Integer,String> yearMap = new HashMap<>();
    @Autowired
    private IEvidenceService evidenceService;

    EvidenceController(){
        //这里隐藏了一些支持检索字段，内容较少且面向非专业用户，不必太复杂
        searchFieldMap.put(1,"全 部");searchFieldMap.put(2,"标 题");searchFieldMap.put(3,"关 键 词");searchFieldMap.put(4,"摘 要");
        //筛选方案
        //typeList.add("全部");typeList.add("临床指南");typeList.add("系统评价");typeList.add("药物信息");typeList.add("卫生技术评估");
        //typeList.add("百科知识");typeList.add("患者手册");typeList.add("多媒体资料");typeList.add("网站资讯");
    }

    @RequestMapping("/index")
    public String gotoIndex(ModelMap modelMap){
        return "/evidence/index";
    }

    @RequestMapping("/queryEvidence")
    public String queryEvidence(@ModelAttribute("simpleQueryObject") SimpleQueryObject simpleQueryObject,ModelMap modelMap){
        EvidenceQueryObject queryObject = new EvidenceQueryObject();
        //使用@ModelAttribute可以将接收到的EvidenceQueryObject自动更新到request/modelMap中
        String searchTerm = simpleQueryObject.getSearchTerm();
        switch (simpleQueryObject.getFieldCode()){
            case 1:
                break;
            case 2:
                queryObject.setTitle(searchTerm);
                break;
            case 3:
                queryObject.setKeywords(searchTerm);
                break;
            case 4:
                queryObject.setSummary(searchTerm);
                break;
            default:
                logger.info("wrong fieldCode");
                break;
        }
        List<Evidence> evidences = evidenceService.queryEvidence(queryObject);
        List<String> evidenceTypes = evidenceService.getEvidenceTypes(queryObject);
        modelMap.put("evidenceTypes",evidenceTypes);
        modelMap.put("evidenceList",evidences);
        return "/evidence/search";
    }

    @ModelAttribute("simpleQueryObject")
    public SimpleQueryObject prepareConditions(ModelMap modelMap){
        modelMap.put("searchFieldMap",searchFieldMap);
        modelMap.put("yearMap",yearMap);
        return new SimpleQueryObject();
    }
}
