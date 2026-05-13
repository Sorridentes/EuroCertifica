package com.eurocertifica.backend.features.gamification.application.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RankingDTO {
    private String userName;
    private Integer fliesCount;
    private String level;
}