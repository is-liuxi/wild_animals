package cn.hniu.listener;

import cn.hniu.common.Constants;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * <p>
 *  监听器：上下文路径
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
@WebListener
@Slf4j
public class ApplicationContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        // 获取项目上下文路径
        String contextPath = context.getContextPath();
        log.info("项目上下文路径：{}", contextPath);

        // 将上下文路径保存到 application域中
        context.setAttribute(Constants.APPLICATION_CONTEXT, contextPath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
