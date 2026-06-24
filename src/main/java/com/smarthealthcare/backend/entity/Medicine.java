package com.smarthealthcare.backend.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "medicines")
@Getter
@Setter
public class Medicine {

    @Id
    @Column(name = "medicine_id")
    private Integer medicineId;

    @Column(name = "generic_name")
    private String genericName;

    @Column(name = "brand_name")
    private String brandName;

    private String category;

    private String description;

    @Column(name = "side_effects")
    private String sideEffects;
}