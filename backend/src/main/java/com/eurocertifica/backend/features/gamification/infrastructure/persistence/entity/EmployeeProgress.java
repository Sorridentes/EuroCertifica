package com.eurocertifica.backend.features.gamification.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

import com.eurocertifica.backend.features.auth.infrastructure.persistence.entity.User;

@Entity
@Table(name = "EC_TB_COLABORADOR_STATUS")
@Data
public class EmployeeProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_SAPO")
    private Long id;

    @OneToOne
    @JoinColumn(name = "ID_USUARIO", nullable = false)
    private User user;

    @Column(name = "QTD_MOSCAS")
    private Integer points = 0;

    @Column(name = "NIVEL_ATUAL")
    private String currentLevel = "BEGINNER";

    @Column(name = "POSICAO_TRILHA")
    private Integer trackPosition = 0;

    @Column(name = "ST_AMEACA_COBRA")
    private String penaltyStatus = "N";

    @Column(name = "DT_ULTIMA_ATIVIDADE")
    private LocalDate lastActivityDate = LocalDate.now();
}