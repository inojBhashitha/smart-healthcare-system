package com.smarthealthcare.backend.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @Column(name = "user_id")
    private Long userId;

    private String name;

    private String email;

    private String role;
}