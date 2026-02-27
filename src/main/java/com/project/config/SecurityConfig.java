package com.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.project.common.security.CustomAccessDeniedHandler;
import com.project.common.security.CustomLoginSuccessHandler;
import com.project.common.security.CustomUserDetailsService;

import jakarta.servlet.DispatcherType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig {

	@Autowired
	DataSource dataSource;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		log.info("security config");

		// 1.csrf 토큰 비활성화
		httpSecurity.csrf((csrf) -> csrf.disable());

		// 2.시큐리티 인가정책
		httpSecurity.authorizeHttpRequests(auth -> auth
				.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll().requestMatchers("/accessError",
						"/auth/login", "/auth/logout", "/css/**", "/js/**", "/error", "/user/setup", "/user/register")
				.permitAll().anyRequest().permitAll());

		// 3.접근거부시 예외처리 설정
		httpSecurity.exceptionHandling(exception -> exception.accessDeniedHandler(createAccessDeniedHandler()));

		// 4.기본폼 로그인을 활성화
		httpSecurity.formLogin(form -> form.loginPage("/auth/login").loginProcessingUrl("/login")
				.successHandler(createAuthenticationSuccessHandler()).permitAll());

		// 5.로그아웃처리 설정
		httpSecurity.logout(logout -> logout.logoutUrl("/auth/logout").logoutSuccessUrl("/auth/login")
				.invalidateHttpSession(true).deleteCookies("JSESSIONID", "remember-me").permitAll());

		// 6.자동로그인기능(Remember-Me) 설정
		httpSecurity.rememberMe(remember -> remember.key("zeus").tokenRepository(createJDBCRepository())
				.tokenValiditySeconds(60 * 60 * 24));

		return httpSecurity.build();
	}

	// [수정] static을 추가하여 클래스 초기화 시점보다 먼저 빈을 생성하게 함 (순환 참조 해결 핵심)
	@Bean
	public static PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}

	// [삭제] 순환 참조 원인: AuthenticationManagerBuilder 설정 메서드 삭제
	// 이유: UserDetailsService와 PasswordEncoder가 Bean으로 등록되어 있으면 스프링 시큐리티가 자동으로 연동함

	@Bean
	public UserDetailsService createUserDetailsService() {
		return new CustomUserDetailsService();
	}

	@Bean
	public AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
}