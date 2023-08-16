package com.bhs.server.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bhs.server.domain.Diner;
import com.bhs.server.service.DinerService;

@RequestMapping("/search")
@Controller
public class SearchController {
    @Autowired
    private DinerService service;

    @GetMapping("diner.do")
    @ResponseBody
    public List<Diner> diner(String q) {
        List<Diner> list = service.list(q);

        return list;
    }
}
