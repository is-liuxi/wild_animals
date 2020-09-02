package cn.hniu.controller;

import cn.hniu.common.Constants;
import cn.hniu.pojo.ProtectionTrends;
import cn.hniu.pojo.Rules;
import cn.hniu.pojo.Type;
import cn.hniu.pojo.TypeDetails;
import cn.hniu.service.ProtectionTrendsService;
import cn.hniu.service.RulesService;
import cn.hniu.service.TypeDetailsService;
import cn.hniu.service.TypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用于跳转页面
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
@Controller
@Slf4j
public class PageForwardController {

    @Autowired
    private RulesService rulesService;

    @Autowired
    private ProtectionTrendsService protectionTrendsService;

    @Autowired
    private TypeDetailsService typeDetailsService;

    @Autowired
    private TypeService typeService;

    // tomcat启动，跳转到首页
    @GetMapping("main/index")
    public String index() {

        return "index";
    }

    // 跳转到兽类界面，将查询到的动物种类保存到域中
    // ?：任意一个字符，ant模式
    @GetMapping("type/101?")
    public String birdsPage(HttpServletRequest req, Map<String, Object> map) {
        String uri = req.getRequestURI();

        // 获取最后的资源路径
        String[] split = uri.split("/");

        Integer typeId = Integer.parseInt(split[split.length - 1]);
        log.info("请求的类别 id：{}", typeId);

        // 每个动物的具体描述
        List<TypeDetails> list = typeDetailsService.selectTypeDetailsByTypeId(typeId);
        // 保存到 request域中
        map.put(Constants.ANIMAL_NAME, list);

        // 类型
        Type type = typeService.selectByPrimaryKey(typeId);
        map.put(Constants.TYPE_NAME, type);

        return "type/birds";
    }

    @GetMapping("login")
    public String loginPage() {

        return "login";
    }

    // 跳转到管理员界面
    @GetMapping("manager/index")
    public String managerIndexPage() {

        return "manager/index";
    }

    // 添加物种信息
    @GetMapping("addAnimalPage")
    public String addAnimalPage() {

        return "manager/addAnimalPage";
    }

    // 查看物种信息
    @GetMapping("animalsPag")
    public String animalsPag() {

        return "manager/animalsPag";
    }

    // 物种保护动态
    @GetMapping("protectionTrends")
    public String protectionTrends() {

        return "manager/protectionTrends";
    }

    // 物种保护，政策法规
    @GetMapping("rules")
    public String RulesPage() {

        return "manager/rules";
    }

    // 内容显示，将查询后的结果存储到 request域中
    @GetMapping("rules/{id}")
    public String rulesContent(@PathVariable Integer id, Map<String, Object> map) {
        log.info("查看内容，id：{}", id);
        Rules rules = rulesService.selectRulesById(id);

        map.put(Constants.CONTENT, rules);

        return "content/rulesContent";
    }

    @GetMapping("protectionTrends/{id}")
    public String protectionTrendsContent(@PathVariable Integer id, Map<String, Object> map) {
        log.info("查看内容，id：{}", id);
        ProtectionTrends protectionTrends = protectionTrendsService.selectProtectionTrendsById(id);

        map.put(Constants.CONTENT, protectionTrends);

        return "content/protectionTrendsContent";
    }

    // 退出登录
    @GetMapping("manager/logout")
    public String logout(HttpServletRequest req) {
        // 清除登录用户信息
        req.getSession().invalidate();

        String contextPath = req.getServletContext().getContextPath();
        log.info("上下文路径：{}", contextPath);

        // 重定向到首页
        return "redirect: " + contextPath + "/main/index";
    }
}
