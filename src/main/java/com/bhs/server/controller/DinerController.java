package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bhs.server.domain.Diner;
import com.bhs.server.service.DinerService;

@Controller
@RequestMapping("/diner")
public class DinerController {
    @Autowired
    private DinerService service;

    @PostMapping("/insert.do")
    @ResponseBody
    public ResponseEntity<String> insert(Diner diner) {
        int seq = service.insert(diner).getSeq();
        return ResponseEntity.ok().contentType(MediaType.TEXT_PLAIN).body(String.valueOf(seq));
    }

    @GetMapping("/detail.do")
    public String dinerDetail(Model model, int seq) {
        model.addAttribute("diner", service.getDiner(seq));
        return "diner";
    }
}
