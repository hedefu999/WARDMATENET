package com.wardmate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
    @RequestMapping("/index")
    public String community(){
        return "/community/community";
    }
}
