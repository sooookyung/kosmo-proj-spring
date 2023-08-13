package com.bhs.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bhs.server.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

}
