package org.joa.swft.manager.sercurity;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.exception.CustomErrorCode;
import org.joa.swft.manager.filter.JwtAuthFilter;
import org.joa.swft.pojo.vo.ResultVo;
import org.joa.swft.service.CustomUserDetailService;
import org.joa.swft.util.JwtUtil;
import org.joa.swft.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author JiangTeJie
 * @date 2019/12/2915:22
 */

@Slf4j
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private CustomUserDetailService customUserDetailService;

    @Bean
    public JwtAuthFilter myAuthFilter() throws Exception {
        return new JwtAuthFilter();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setHideUserNotFoundExceptions(false);
        provider.setUserDetailsService(customUserDetailService);
        provider.setPasswordEncoder(new CustomPasswordEncoder());
        return provider;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.addFilterBefore(myAuthFilter(), UsernamePasswordAuthenticationFilter.class);
        http
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers("/user/login", "/logout", "/toLogin").permitAll()
                .anyRequest()
                .fullyAuthenticated()
                .and()
                .formLogin()
                .loginPage("/toLogin")
                .loginProcessingUrl("/user/login")
                .successHandler((request, response, authentication) -> {
                    if (log.isDebugEnabled()) {
                        log.debug("登陆成功({})", authentication.getPrincipal());
                    }
                    Map tokenData = new HashMap(8);
                    try {
                        tokenData.put("token", jwtUtil.createJWT(UUID.randomUUID().toString(), UserUtil.getCurrentUser()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVo.success(tokenData)));
                })
                .failureHandler((request, response, ex) -> {
                    if (log.isDebugEnabled()) {
                        log.debug("登录失败({})", ex.getMessage());
                    }
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVo.error(ex.getMessage())));
                })
                .and()
                .exceptionHandling().authenticationEntryPoint((request, response, ex) -> {
                if (log.isDebugEnabled()) {
                    log.debug("token无效({})", ex.getMessage());
                }
            response.getWriter().write(objectMapper.writeValueAsString(ResultVo.error(CustomErrorCode.INVALID_TOKEN)));
        })
                .accessDeniedHandler((request, response, ex) -> {
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVo.error(CustomErrorCode.ACCESS_DENIED)));
                })
                .and()
                .logout()
                .invalidateHttpSession(true)
                .logoutUrl("/logout").logoutSuccessHandler((request, response, authentication) -> {
                if (log.isDebugEnabled()) {
                    log.debug("退出成功");
                }
                response.getWriter().write(objectMapper.writeValueAsString(ResultVo.success("退出成功!")));
        });
    }

    class CustomPasswordEncoder implements PasswordEncoder {
        @Override
        public String encode(CharSequence charSequence) {
            return charSequence.toString();
        }

        @Override
        public boolean matches(CharSequence charSequence, String s) {
            return s.equals(charSequence.toString());
        }
    }
}
