package com.wardmate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/knowledge")
public class KnowledgeController {
    @RequestMapping("/index")
    public String knowledge(){
        return "/knowledge/knowledge";
    }
}
