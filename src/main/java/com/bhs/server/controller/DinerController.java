package com.bhs.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bhs.server.domain.Diner;
import com.bhs.server.service.DinerService;

@Controller
@RequestMapping("/diner")
public class DinerController {
    @Autowired
    private DinerService service;

    @PostMapping("/diner/insert.do")
    public void insert(Diner diner) {
        service.insert(diner);
    }
}
