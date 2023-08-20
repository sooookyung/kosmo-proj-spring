package com.bhs.server.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.bhs.server.domain.Board;
import com.bhs.server.domain.Diner;
import com.bhs.server.domain.Member;
import com.bhs.server.repository.BoardRepository;
import com.bhs.server.repository.DinerRepository;
import com.bhs.server.repository.MemberRepository;

@Service
public class BoardService {
    @Autowired
    private BoardRepository repository;

    @Autowired
    private DinerRepository dinerRepository;

    @Autowired
    private MemberRepository memberRepository;

    public List<Board> list() {
        // return repository.findAll(Sort.by(Sort.Direction.DESC,"seq")); //seq내림차순으로
        // 데이터 정렬
        return repository.findByParentIsNullOrderBySeqDesc();
    }

    public List<Board> list(int seq) {
        // return repository.findAll(Sort.by(Sort.Direction.DESC,"seq")); //seq내림차순으로
        // 데이터 정렬
        return repository.findBySeq(seq);
    }

    public List<Board> list2(int seq) {
        return repository.save(null);
    }

    public void insert(String title, String content, String dinerSeq, String email) {
        Board board = new Board();
        board.setTitle(title);
        board.setContent(content);
        Diner diner = dinerRepository.findById(Integer.parseInt(dinerSeq)).orElseThrow();
        board.setDiner(diner);
        Member member = memberRepository.findByEmail(email);
        board.setWriter(member);
        repository.save(board);
    }
}
