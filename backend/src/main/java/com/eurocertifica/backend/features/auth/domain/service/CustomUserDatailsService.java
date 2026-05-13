package com.eurocertifica.backend.features.auth.domain.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.eurocertifica.backend.features.auth.domain.repository.UserRepository;
import com.eurocertifica.backend.features.auth.infrastructure.persistence.entity.User;

@Service
public class CustomUserDatailsService implements UserDetailsService {
    private UserRepository userRepository;

    public void CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with email: " + email));

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority(user.getProfile().getDescription()))
        );
    }
    
}
