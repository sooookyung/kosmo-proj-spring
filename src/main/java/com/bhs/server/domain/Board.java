package com.bhs.server.domain;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seq;

    private String title;
    private String content;
    private Date rdate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "writer")
    private Member writer;

    @ManyToOne(optional = false)
    @JoinColumn(name = "diner_seq")
    private Diner diner;
    
    @ManyToOne(optional = true)
    @JoinColumn(name = "parent")
    private Board parent;

    @OneToOne(optional = true)
    @JoinColumn(name = "file_id")
    private FileUp fileUp;
}