package com.bhs.server.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.bhs.server.domain.Board;
import com.bhs.server.repository.BoardRepository;

@Service
public class BoardService {
    @Autowired
    private BoardRepository repository;
    
    public List<Board> list() {
        // return repository.findAll(Sort.by(Sort.Direction.DESC,"seq"));
        return repository.findByParentIsNullOrderBySeqDesc();
    }
    
}
