package com.eurocertifica.backend.features.gamification.domain.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eurocertifica.backend.features.gamification.domain.repository.EmployeeProgressRepository;

@Service
public class GamificationService {

    private final EmployeeProgressRepository repository;
    private static final double PENALTY_PERCENTAGE = 0.10; // Penalidade de 10%

    public GamificationService(EmployeeProgressRepository repository) {
        this.repository = repository;
    }

    @Transactional
    public void rewardPoints(Long userId, Integer amount) {
        repository.findByUserId(userId).ifPresent(progress -> {
            progress.setPoints(progress.getPoints() + amount);
            progress.setLastActivityDate(LocalDate.now());
            progress.setPenaltyStatus("N"); // Interação remove risco de penalidade
            repository.save(progress);
        });
    }

    @Transactional
    public void applyInactivityPenalty(Long userId) {
        repository.findByUserId(userId).ifPresent(progress -> {
            // Ativa o status de penalidade (Cobra)
            progress.setPenaltyStatus("S");
            
            // Regra: reduzir pontos
            int penaltyPoints = (int) (progress.getPoints() * PENALTY_PERCENTAGE);
            progress.setPoints(progress.getPoints() - penaltyPoints);

            //Garante que os pontos não fiquem negativos
            if (progress.getPoints() < 0) {
                progress.setPoints(0);
            }
            
            repository.save(progress);
        });
    }
}
