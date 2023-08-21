package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bhs.server.service.DinerService;

@Controller
public class MapController {
    @Autowired
    private DinerService dinerService;
    
    @GetMapping("map.do")
    public String map(Model model) {
        model.addAttribute("list", dinerService.list());
        return "map";
    }
}
