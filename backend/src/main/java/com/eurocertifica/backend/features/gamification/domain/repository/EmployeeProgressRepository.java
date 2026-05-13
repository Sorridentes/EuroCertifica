package com.eurocertifica.backend.features.gamification.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eurocertifica.backend.features.gamification.infrastructure.persistence.entity.EmployeeProgress;

public interface EmployeeProgressRepository extends JpaRepository<EmployeeProgress, Long> {

    Optional<EmployeeProgress> findByUserId(Long userId);

    // Retornar o top 10 para a tela de ranking
    List<EmployeeProgress> findTop10ByOrderByPointsDesc();
}
