package cn.hniu.controller;

import cn.hniu.common.Constants;
import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.Admin;
import cn.hniu.service.AdminService;
import cn.hniu.util.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
@RestController
@Slf4j
public class LoginController {

    @Autowired
    private AdminService adminService;

    @PostMapping("login")
    public Result<Integer> login(@RequestBody Admin admin, HttpServletRequest req) {
        log.info("用户登录，传入的值：{}", admin);

        // 密码进行 MD5加密
        admin.setAdminPassword(MD5Util.toMD5(admin.getAdminPassword()));
        Admin result = adminService.login(admin);

        if (result == null)
            return Result.fail(ResultStatus.FAIL, 500, "用户名或者密码错误");

        // 将管理员登录信息保存到 session域中
        req.getSession().setAttribute(Constants.LOGIN_USER, result);

        return Result.success(ResultStatus.SUCCESS);
    }
}
