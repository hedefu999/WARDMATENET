package com.wardmate.controller;

import com.google.common.collect.Maps;
import com.wardmate.constant.SimpleHttpMessage;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.model.KnowledgeCard;
import com.wardmate.model.NoteSnippet;
import com.wardmate.serviceInterface.IKnowledgeService;
import com.wardmate.serviceInterface.INoteBookService;
import com.wardmate.vo.FeedbackMessage;
import com.wardmate.vo.KnowledgeCardQueryConditions;
import com.wardmate.vo.PageQueryResult;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/knowledge")
public class KnowledgeController {

    private Logger logger = LogManager.getLogger();

    @Autowired
    private IKnowledgeService knowledgeService;
    @Autowired
    private INoteBookService noteBookService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String knowledge(){
        return "forward:/knowledge/aboutEBM";
    }

    @RequestMapping("/aboutEBM")
    public String knowledgeEBM(HttpServletRequest request){
        return "/knowledge/knowledgeEBM";
    }

    //定义分页、单次加载知识卡片的数量
    private static final int pageSize = 6;

    @RequestMapping("/queryKnowledgeCard")
    public String queryKnowledgeCard(KnowledgeCardQueryConditions conditions, ModelMap modelMap){
        HashMap<String,Object> conditionMap = Maps.newHashMap();
        conditionMap.put("skipRecords",pageSize*(conditions.getPageIndex() - 1));
        conditionMap.put("pageSize",pageSize);
        conditionMap.put("pageIndex",conditions.getPageIndex());
        conditionMap.put("keyword",conditions.getKeyword());
        conditionMap.put("firstPhoneticLetter",conditions.getFirstPhoneticLetter());
        //限定页面一次显示5个
        PageQueryResult result = knowledgeService.queryCardByConditions(conditionMap);
        //回显筛选条件
        modelMap.put("queryConditions",conditions);
        //分页查询结果封装到PageQueryResult类，在前台用pagenavigator.jsp解析，生成分页按钮
        modelMap.put("pageResult",result);
        //前台页面遍历生成列表
        modelMap.put("knowledgeCards",result.getRecordList());
        return "/knowledge/knowledgecard";
    }

    @ResponseBody
    @RequestMapping("/getMoreCard")
    public List<KnowledgeCard> getMoreCard(@RequestBody KnowledgeCardQueryConditions conditions){
        HashMap<String,Object> conditionMap = Maps.newHashMap();
        conditionMap.put("skipRecords",pageSize*(conditions.getPageIndex() - 1));
        conditionMap.put("pageSize",pageSize);
        conditionMap.put("keyword",conditions.getKeyword());
        return knowledgeService.queryCardForJson(conditionMap);
    }

    @ResponseBody
    @RequestMapping("/collect/snippet")
    public FeedbackMessage collectSnippets(@RequestBody NoteSnippet noteSnippet){
        noteBookService.saveUserSelectedText(noteSnippet);
        return new FeedbackMessage("feedback",SimpleHttpMessage.SNIPPET_SAVED_SUCCESS);
    }

    @ResponseBody
    @RequestMapping("/collect/getSnippet")
    public List<NoteSnippet> getSnippetForAjax(Integer userId,Integer pageNo){
        return noteBookService.getNoteBookPage(userId, pageNo).getNoteSnippets();
    }

    @ResponseBody
    @RequestMapping("/collect/deleteSnippet")
    public String deleteSnippet(Integer noteId){
        noteBookService.deleteNoteByNoteId(noteId);
        return "删除笔记成功";
    }

    @ModelAttribute("queryConditions")
    public KnowledgeCardQueryConditions prepareConditions(KnowledgeCardQueryConditions conditions){
        if (conditions == null){
            return new KnowledgeCardQueryConditions();
        }else{
            return conditions;
        }
    }
}
