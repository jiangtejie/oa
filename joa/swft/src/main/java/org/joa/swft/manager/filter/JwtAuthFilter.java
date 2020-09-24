package org.joa.swft.manager.filter;

import com.google.common.cache.Cache;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.joa.swft.config.GuavaCacheConfig;
import org.joa.swft.manager.sercurity.AuthUser;
import org.joa.swft.service.CustomUserDetailService;
import org.joa.swft.service.impl.TokenAuthorizationService;
import org.joa.swft.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author JiangTeJie
 * @date 2019/12/2920:16
 */

@Slf4j
public class JwtAuthFilter extends OncePerRequestFilter {

    @Autowired
    private TokenAuthorizationService tokenAuthorizationService;

    @Autowired
    private CustomUserDetailService customUserDetailService;

    private final String tokenHeader = "Authorization";

    private final String loginUrl = "login";

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {

        //先从url中取token
        String authTokenParam = request.getParameter("token");
        String authHeader = request.getHeader(this.tokenHeader);

        if (StringUtils.isNotBlank(authHeader)) {
            //如果header中存在token，则覆盖掉url中的token
            authTokenParam = authHeader;
        }

        //token校验，是否是合理的token
        if (StringUtils.isNotBlank(authTokenParam)) {

            String username = null, role = null;

            try {
                username = tokenAuthorizationService.verifyToken(authTokenParam);
            } catch (Exception e) {
                log.error("登录过期");
            }
            // 如果jwt正确解出账号信息，说明是合法用户，设置认证信息，认证通过
            if (null != username && null == SecurityContextHolder.getContext().getAuthentication()) {

                //每次请求 都重新加载一遍权限
                UserDetails userDetails = customUserDetailService.loadUserByUsername(username);

                UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                // 把请求的信息设置到UsernamePasswordAuthenticationToken details对象里面，包括发请求的ip等
                auth.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                if (log.isDebugEnabled()) {
                    log.debug("设置用户认证信息({})", auth);
                }
                // 全局设置用户登录状态的信息，方便以后全局取出
                SecurityContextHolder.getContext().setAuthentication(auth);
            }
        } else {
            if (request.getRequestURI().indexOf(loginUrl) == -1) {
                log.error("请求 URI({}),没有携带token", request.getRequestURI());
            }
        }

        // 调用下一个过滤器
        chain.doFilter(request, response);
    }
}
