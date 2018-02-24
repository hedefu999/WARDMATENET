package com.wardmate.controller;

import com.wardmate.model.Evidence;
import com.wardmate.serviceInterface.IEvidenceService;
import com.wardmate.vo.EvidenceQueryObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/evidence")
public class EvidenceController {
    private static List<String> typeList = new ArrayList<>();
    @Autowired
    private IEvidenceService evidenceService;

    EvidenceController(){
        //简单搜索应按标题、关键词等筛选
        typeList.add("全部");typeList.add("临床指南");typeList.add("系统评价");typeList.add("药物信息");typeList.add("卫生技术评估");
        typeList.add("百科知识");typeList.add("患者手册");typeList.add("多媒体资料");typeList.add("网站资讯");
    }

    @RequestMapping("/index")
    public String gotoIndex(ModelMap modelMap){
        return "/evidence/index";
    }
    @RequestMapping("/queryEvidence")
    public String queryEvidence(@ModelAttribute("queryObject") EvidenceQueryObject queryObject,ModelMap modelMap){
        //使用@ModelAttribute可以将接收到的EvidenceQueryObject自动更新到request/modelMap中
        if(queryObject.getType().equals("全部")){
            queryObject.setType(null);
        }
        List<Evidence> evidences = evidenceService.queryEvidence(queryObject);
        modelMap.put("evidenceList",evidences);
        return "/evidence/search";
    }

    @ModelAttribute("queryObject")
    public EvidenceQueryObject prepareConditions(ModelMap modelMap){
        modelMap.put("evidenceType",typeList);
        return new EvidenceQueryObject();
    }
}
