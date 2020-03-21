package org.joa.swft.aop.log;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.joa.swft.pojo.dto.LogDto;
import org.joa.swft.pojo.entity.Log;
import org.joa.swft.service.LogService;
import org.joa.swft.util.AnnotationUtil;
import org.joa.swft.util.HttpUtil;
import org.joa.swft.util.ServletUtil;
import org.joa.swft.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * @Classname LogService
 * @Description 日志记录 切面
 * @Date 2019/9/27 0027 18:16
 * @Author by jtj
 */
@Component
@Aspect
@Slf4j
public class LogServiceAspect {

    @Autowired
    private LogService logService;

    /**
     * 切点
     */
    @Pointcut("@annotation(org.joa.swft.annotation.OptionLog)")
    public void methodCachePointcut() { }

    /**
     * 切面
     *
     * @param point
     * @return
     * @throws Throwable
     */
    @Around("methodCachePointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String ip = HttpUtil.getIp(request);

        LogDto logDto = AnnotationUtil.getOptionModule(point);

        Map<String,String> params = ServletUtil.converMap(ServletUtil.getHttpServletRequest().getParameterMap());

        Log log = new Log();
        log.setOptionUser(UserUtil.getCurrentUser().getUser().getId());
        log.setOptionUsername(UserUtil.getCurrentUser().getUser().getRealName());
        log.setOptionTarget(logDto.getOptionModule());
        log.setOptionType(logDto.getOptionType());
        log.setRemark(logDto.getOptionDesc());
        log.setCreateTime(new Date());
        if(!params.isEmpty()){
            log.setOptionParams(JSONObject.toJSONString(params));
        }
        log.setIp(ip);
        logService.save(log);
        return point.proceed();
    }
}
