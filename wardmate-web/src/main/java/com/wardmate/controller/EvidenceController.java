package com.wardmate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("evidence")
public class EvidenceController {
    @RequestMapping("index")
    public String evidence(){
        return "/evidence/evidence";
    }
}
