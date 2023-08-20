package com.bhs.server.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bhs.server.domain.Board;
import com.bhs.server.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService service;

    @GetMapping("/list.do")
    public String board(Model model) {
        model.addAttribute("list", service.list());
        return "list";
    }

    @GetMapping("/write.do")
    public String write() {
        return "write";
    }

    @GetMapping("/boardcontent.do")
    public String boardcontent(Model model, int seq) { // model : jsp에 데이터를 넘겨주기위해 사용
        model.addAttribute("list", service.list(seq));
        return "boardcontent";
    }

    @PostMapping("/write.do")
    public String write2(String title, String content, @RequestParam("diner_seq") String dinerSeq, String email) {
        service.insert(title, content, dinerSeq, email);
        return "redirect:list.do";
    }

}
