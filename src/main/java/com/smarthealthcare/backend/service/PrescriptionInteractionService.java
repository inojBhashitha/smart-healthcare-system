package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.dto.druginteraction.DrugInteractionResult;
import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.entity.PrescriptionInteraction;
import com.smarthealthcare.backend.repository.PrescriptionInteractionRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescriptionInteractionService {

    private final PrescriptionInteractionRepository repository;

    public PrescriptionInteractionService(
            PrescriptionInteractionRepository repository) {

        this.repository = repository;
    }

    public void saveInteractions(
            Prescription prescription,
            List<DrugInteractionResult> interactions) {

        for (DrugInteractionResult result : interactions) {

            PrescriptionInteraction interaction =
                    new PrescriptionInteraction();

            interaction.setPrescription(prescription);
            interaction.setDrug1(result.getDrug1());
            interaction.setDrug2(result.getDrug2());
            interaction.setDescription(result.getDescription());

            repository.save(interaction);
        }
    }
}