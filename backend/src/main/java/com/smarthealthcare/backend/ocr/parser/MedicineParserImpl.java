package com.smarthealthcare.backend.ocr.parser;

import com.smarthealthcare.backend.ocr.dto.MedicineInfo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class MedicineParserImpl implements MedicineParser {

    private static final Pattern MEDICINE_PATTERN =
            Pattern.compile("^\\d*\\.?\\s*([A-Za-z]+(?:\\s[A-Za-z]+)*)\\s+(\\d+(?:mg|g|ml))$",
                    Pattern.CASE_INSENSITIVE);

    @Override
    public List<MedicineInfo> parse(String text) {

        List<MedicineInfo> medicines = new ArrayList<>();

        String[] lines = text.split("\\r?\\n");

        MedicineInfo current = null;

        for (String line : lines) {

            line = line.trim();

            Matcher matcher = MEDICINE_PATTERN.matcher(line);

            if (matcher.find()) {

                current = new MedicineInfo();

                current.setName(matcher.group(1));
                current.setStrength(matcher.group(2));

                medicines.add(current);

            } else if (current != null &&
                    line.toLowerCase().startsWith("take")) {

                current.setInstruction(line);
            }
        }

        return medicines;
    }
}