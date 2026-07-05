package com.smarthealthcare.backend.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "drug_interactions")
public class DrugInteraction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "drug1", nullable = false)
    private String drug1;

    @Column(name = "drug2", nullable = false)
    private String drug2;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    public DrugInteraction() {
    }

    public Long getId() {
        return id;
    }

    public String getDrug1() {
        return drug1;
    }

    public void setDrug1(String drug1) {
        this.drug1 = drug1;
    }

    public String getDrug2() {
        return drug2;
    }

    public void setDrug2(String drug2) {
        this.drug2 = drug2;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}