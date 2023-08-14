package com.bhs.server.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Table(name = "file_up")
@Entity
public class FileUp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "file_id")
    private long id;
    private String orgnm;
    private String savednm;
    private String savedpath;
    private String contentType;

    @Builder
    public FileUp(long id, String orgnm, String savednm, String savedpath, String contentType) {
        this.id = id;
        this.orgnm = orgnm;
        this.savednm = savednm;
        this.savedpath = savedpath;
        this.contentType = contentType;
    }
}