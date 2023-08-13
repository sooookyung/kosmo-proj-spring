package com.bhs.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bhs.server.domain.Diner;

public interface DinerRepository extends JpaRepository<Diner, Integer> {

}