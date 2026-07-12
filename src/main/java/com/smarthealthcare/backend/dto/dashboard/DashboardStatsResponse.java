package com.smarthealthcare.backend.dto.dashboard;

public class DashboardStatsResponse {

    private long totalPrescriptions;
    private long totalMedicines;
    private long verifiedMedicines;
    private long totalInteractions;

    public DashboardStatsResponse() {
    }

    public DashboardStatsResponse(
            long totalPrescriptions,
            long totalMedicines,
            long verifiedMedicines,
            long totalInteractions) {

        this.totalPrescriptions = totalPrescriptions;
        this.totalMedicines = totalMedicines;
        this.verifiedMedicines = verifiedMedicines;
        this.totalInteractions = totalInteractions;
    }

    public long getTotalPrescriptions() {
        return totalPrescriptions;
    }

    public void setTotalPrescriptions(long totalPrescriptions) {
        this.totalPrescriptions = totalPrescriptions;
    }

    public long getTotalMedicines() {
        return totalMedicines;
    }

    public void setTotalMedicines(long totalMedicines) {
        this.totalMedicines = totalMedicines;
    }

    public long getVerifiedMedicines() {
        return verifiedMedicines;
    }

    public void setVerifiedMedicines(long verifiedMedicines) {
        this.verifiedMedicines = verifiedMedicines;
    }

    public long getTotalInteractions() {
        return totalInteractions;
    }

    public void setTotalInteractions(long totalInteractions) {
        this.totalInteractions = totalInteractions;
    }
}