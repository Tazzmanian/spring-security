package com.spring.secutiry.SecurityDemo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.password.CompromisedPasswordChecker;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.password.HaveIBeenPwnedRestApiPasswordChecker;

@Configuration
public class SecurityConfig {

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
//        http.authorizeHttpRequests((requests) -> requests.anyRequest().permitAll());
//        http.authorizeHttpRequests((requests) -> requests.anyRequest().denyAll());
        http.authorizeHttpRequests((requests) -> requests
                .requestMatchers("/myAccount", "/myBalance", "/myLoans", "/myCards").authenticated()
                .requestMatchers("/notices", "/contact", "/error").permitAll());
        http.formLogin(Customizer.withDefaults());
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

//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails user = User.withUsername("user").password("{noop}EazyBytes@12345").authorities("read").build();
//        UserDetails admin = User.withUsername("admin")
//                .password("{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m")
//                .authorities("admin").build();
//        return new InMemoryUserDetailsManager(user, admin);
//    }

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
