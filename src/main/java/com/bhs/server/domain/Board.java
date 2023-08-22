package com.bhs.server.domain;

import java.util.Date;
import java.util.Set;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seq;

    private String title;
    private String content;
    @CreationTimestamp
    private Date rdate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "writer")
    private Member writer;

    @ManyToOne(optional = false)
    @JoinColumn(name = "diner_seq")
    private Diner diner;

    @ManyToOne(optional = true)
    @JoinColumn(name = "parent", insertable = true, updatable = false)
    private Board parent;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "parent", fetch = FetchType.EAGER)
    private Set<Board> children;

    @OneToOne(optional = true)
    @JoinColumn(name = "file_id")
    private FileUp fileUp;
}