package com.eurocertifica.backend.features.auth.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eurocertifica.backend.features.auth.infrastructure.persistence.entity.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Método usado pelo Security para autenticar via Email
    Optional<User> findByEmail(String email);
    
}
