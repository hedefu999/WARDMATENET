package com.wardmate.controller;

import com.wardmate.mapper.DiseaseMapper;
import com.wardmate.mapper.MedicineMapper;
import com.wardmate.service.WikiService;
import com.wardmate.serviceInterface.IWikiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/management")
public class ManagementController {
    @Autowired
    private IWikiService wikiService;
    @RequestMapping("/index")
    public String management(){
        return "/management/management";
    }
    @RequestMapping("/disease")
    public String disease(){
        return "/management/disease";
    }
    @RequestMapping("/medicine")
    public String medicine(){
        return "/management/medicine";
    }
    @RequestMapping("/healthplans")
    public String healthplans(){
        return "/management/healthplans";
    }
    @ResponseBody
    @RequestMapping("/getDiseaseInstruction/{brief}")
    public String getDiseaseInstruction(@PathVariable("brief") Boolean brief, String name){
        System.out.println("疾病名称："+name);
        String result = null;
        if (brief){
            result = wikiService.getDiseaseInstruction(name);
        }else {
            result = wikiService.getDiseaseWiki(name);
        }
        return result;
    }
    @ResponseBody
    @RequestMapping("/getMedicineInstruction/{brief}")
    public String getMedicineInstruction(@PathVariable("brief") Boolean brief, String name){
        String result = null;
        if (brief){
            result = wikiService.getMedicineInstruction(name);
        }else {
            result = wikiService.getMedicineWiki(name);
        }
        return result;
    }
}
