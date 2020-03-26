package org.joa.swft.manager.sercurity;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.exception.CustomErrorCode;
import org.joa.swft.manager.filter.JwtAuthFilter;
import org.joa.swft.pojo.dto.BusinessType;
import org.joa.swft.pojo.entity.Log;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.CustomUserDetailService;
import org.joa.swft.service.LogService;
import org.joa.swft.service.impl.TokenAuthorizationService;
import org.joa.swft.util.HttpUtil;
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

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    private LogService logService;

    @Autowired
    private TokenAuthorizationService tokenAuthorizationService;

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
        //验证token 在 验证用户名密码 之前
        http.addFilterBefore(myAuthFilter(), UsernamePasswordAuthenticationFilter.class);
        http
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers("/favicon.ico",
                        "/v2/api-docs",
                        "/swagger-resources/configuration/ui",
                        "/swagger-resources",
                        "/swagger-resources/configuration/security",
                        "/swagger-ui.html",
                        "/webjars/**",
                        "/user/login", "/user/logout", "/re-login").permitAll()
                .anyRequest()
                .fullyAuthenticated()
                .and()
                .formLogin()
                .loginPage("/re-login")
                .loginProcessingUrl("/user/login")
                .successHandler((request, response, authentication) -> {
                    User user = UserUtil.getCurrentUser().getUser();
                    if (log.isDebugEnabled()) {
                        log.debug("登陆成功({})", authentication.getPrincipal());
                    }
                    Log log = new Log();
                    log.setOptionUser(UserUtil.getCurrentUser().getUser().getId());
                    log.setOptionUsername(UserUtil.getCurrentUser().getUser().getRealName());
                    log.setOptionTarget("用户登录");
                    log.setOptionType(BusinessType.LOGIN.getType());
                    log.setCreateTime(new Date());
                    log.setIp(HttpUtil.getIp(request));
                    log.setRemark("第" + user.getLoginCount() + "次登录");
                    logService.save(log);
                    Map tokenData = new HashMap(8);
                    try {
                        tokenData.put("token", tokenAuthorizationService.createToken(user.getUsername()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVO.success(tokenData)));
                })
                .failureHandler((request, response, ex) -> {
                    if (log.isDebugEnabled()) {
                        log.debug("登录失败({})", ex.getMessage());
                    }
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVO.error(ex.getMessage())));
                })
                .and()
                .exceptionHandling().authenticationEntryPoint((request, response, ex) -> {
            if (log.isDebugEnabled()) {
                log.debug("无效token({})", ex.getMessage());
            }
            response.getWriter().write(objectMapper.writeValueAsString(ResultVO.error(CustomErrorCode.INVALID_TOKEN)));
        })
                .accessDeniedHandler((request, response, ex) -> {
                    response.getWriter().write(objectMapper.writeValueAsString(ResultVO.error(CustomErrorCode.ACCESS_DENIED)));
                })
                .and()
                .logout()
                .invalidateHttpSession(true)
                .logoutUrl("/user/logout").logoutSuccessHandler((request, response, authentication) -> {
            if (log.isDebugEnabled()) {
                log.debug("退出成功");
            }
            response.getWriter().write(objectMapper.writeValueAsString(ResultVO.success("退出成功!")));
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
