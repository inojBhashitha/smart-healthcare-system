package com.smarthealthcare.backend.medicine.service;

import com.smarthealthcare.backend.medicine.dto.DrugInteractionResult;
import com.smarthealthcare.backend.medicine.entity.DrugInteraction;
import com.smarthealthcare.backend.medicine.repository.DrugInteractionRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DrugInteractionService {

    private final DrugInteractionRepository repository;

    public DrugInteractionService(
            DrugInteractionRepository repository) {

        this.repository = repository;
    }

    public List<DrugInteractionResult> checkInteractions(
            List<String> medicines) {

        List<DrugInteractionResult> results = new ArrayList<>();

        for (int i = 0; i < medicines.size(); i++) {

            for (int j = i + 1; j < medicines.size(); j++) {

                String drug1 = medicines.get(i);
                String drug2 = medicines.get(j);

                List<DrugInteraction> interactions =
                        repository.findInteraction(drug1, drug2);

                for (DrugInteraction interaction : interactions) {

                    results.add(
                            new DrugInteractionResult(
                                    interaction.getDrug1(),
                                    interaction.getDrug2(),
                                    interaction.getDescription()
                            )
                    );
                }
            }
        }

        return results;
    }
}