package com.bhs.server.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Diner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seq;
    private String name;
    private String location;
    private String category;

    @OneToOne(optional = true)
    @JoinColumn(name = "file_id")
    private FileUp fileUp;
}