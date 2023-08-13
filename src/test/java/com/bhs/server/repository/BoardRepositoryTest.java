package com.bhs.server.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.bhs.server.domain.Board;

@SpringBootTest
public class BoardRepositoryTest {
    @Autowired
    private BoardRepository repository;
    
    @Test
    void testFindById() {
        Board board = repository.findById(1).orElseThrow();
        System.out.println(board);
    }
}
