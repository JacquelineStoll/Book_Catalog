package com.bibliothek;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests()
            .requestMatchers("/myBooks.html")
            .hasRole("USER")
            .and()
            .formLogin()
            .and()
            .authorizeHttpRequests()
            .requestMatchers("/**")
            .permitAll();
        return http.build();
        
    }

	@Bean
	public UserDetailsService userDetailsService() {
		InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
		manager.createUser(Userr.withDefaultPasswordEncoder().username("user").password("password").roles("USER").build());
		return manager;
	}
}