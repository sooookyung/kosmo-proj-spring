package com.bhs.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bhs.server.domain.FileUp;

public interface FileUpRepository extends JpaRepository<FileUp, Long> {
}
