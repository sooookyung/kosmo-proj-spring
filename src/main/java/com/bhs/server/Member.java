package com.bhs.server;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    @Id
    private String email;
    private String nickname;
    private String pwd;
    private String name;
    private String ph;
    private long age;
}
