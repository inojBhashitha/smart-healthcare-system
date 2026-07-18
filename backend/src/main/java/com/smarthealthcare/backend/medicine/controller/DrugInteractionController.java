package com.smarthealthcare.backend.medicine.controller;

import com.smarthealthcare.backend.medicine.dto.DrugInteractionResult;
import com.smarthealthcare.backend.medicine.service.DrugInteractionService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/drug-interactions")
public class DrugInteractionController {

    private final DrugInteractionService service;

    public DrugInteractionController(
            DrugInteractionService service) {

        this.service = service;
    }

    @PostMapping("/check")
    public List<DrugInteractionResult> checkInteractions(
            @RequestBody List<String> medicines) {

        return service.checkInteractions(medicines);
    }
}