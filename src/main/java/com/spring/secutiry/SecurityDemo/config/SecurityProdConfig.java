package com.spring.secutiry.SecurityDemo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.authentication.password.CompromisedPasswordChecker;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.password.HaveIBeenPwnedRestApiPasswordChecker;

@Profile("prod")
@Configuration
public class SecurityProdConfig {

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrfConfig -> csrfConfig.disable())
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/myAccount", "/myBalance", "/myLoans", "/myCards").authenticated()
                        .requestMatchers("/notices", "/contact", "/error", "/register").permitAll());
        http.formLogin(Customizer.withDefaults());
        http.redirectToHttps(Customizer.withDefaults()); // HTTPS ONLY
        http.httpBasic(Customizer.withDefaults());
        return http.build();
    }

    ///                        |--------------|
    ///                        |Authentication|
    ///                        |--------------|
    ///                                ^
    ///                                |
    ///                                2
    ///                                |
    /// |------------|          |--------------|          |--------------|          |--------------|
    /// |User Entered|--- 1 --->|Authentication|--- 3 --->|Authentication|--- 4 --->|Authentication|
    /// |credentials |<- 10 ----|   Filter     |<--- 8 ---|   Manager    |<--- 7 ---|  Provider    |
    /// |------------|          |--------------|          |--------------|          |--------------|
    ///                                |                                              |         |
    ///                                9                                              5         6
    ///                                |                                              |         |
    ///                                \/                                             \/        \/
    ///                           |--------|                                 |-----------|   |--------|
    ///                           |Security|                                 |User Detail|   |Password|
    ///                           |Context |                                 |  Service  |   |Encoder |
    ///                           |--------|                                 |-----------|   |--------|

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    /**
     * From Spring Security 6.3 version
     * @return
     */
    @Bean
    public CompromisedPasswordChecker compromisedPasswordChecker() {
        return new HaveIBeenPwnedRestApiPasswordChecker();
    }
}
