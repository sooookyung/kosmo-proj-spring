package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bhs.server.service.BoardService;

@Controller
public class SearchController {
    @Autowired
    private DinerService service;

    @GetMapping("search/diner.do")
    public String search(){
        return "search/diner.do";
    }
    
}
