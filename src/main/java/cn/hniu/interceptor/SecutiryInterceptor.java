package cn.hniu.interceptor;

import cn.hniu.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 *  拦截器，管理员界面必须登录后才能访问
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
@Component
@Slf4j
public class SecutiryInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从 Session会话中获取登录用户信息，如果没有，标识登录认证的 token失效，需要重新登录
        Object admin = request.getSession().getAttribute(Constants.LOGIN_USER);
        log.info("拦截器，校验是否登录：{}", admin);

        if (admin == null) {
            String contextPath = request.getServletContext().getContextPath();
            response.sendRedirect(contextPath + "/main/index");
            return false;
        }

        return true;
    }
}
