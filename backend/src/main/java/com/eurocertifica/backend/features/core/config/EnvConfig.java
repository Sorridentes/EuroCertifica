package com.eurocertifica.backend.features.core.config;

import org.springframework.context.annotation.Configuration;

import io.github.cdimascio.dotenv.Dotenv;

@Configuration
public class EnvConfig {
    static {
        Dotenv dotenv = Dotenv.configure()
            .ignoreIfMissing()
            .directory("../")
            .load();
        dotenv.entries().forEach(entry ->
            System.setProperty(entry.getKey(), entry.getValue())
        );
    }
}
