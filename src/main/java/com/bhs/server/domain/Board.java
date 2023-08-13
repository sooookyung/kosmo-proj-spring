package com.bhs.server.domain;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seq;

    private String title;
    private String content;
    private Date rdate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "email")
    private Member writer;

    @ManyToOne(optional = false)
    @JoinColumn(name = "seq")
    private Diner dinerSeq;
    
    @ManyToOne(optional = true)
    @JoinColumn(name = "seq")
    private Board parent;
}