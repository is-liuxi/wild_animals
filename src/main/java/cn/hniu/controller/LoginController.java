package cn.hniu.controller;

import cn.hniu.common.Constants;
import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.Admin;
import cn.hniu.service.AdminService;
import cn.hniu.util.MD5Util;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/1
 */
@RestController
@Slf4j
@RequestMapping("manager")
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

    @GetMapping("list")
    public Result<PageInfo<Admin>> list(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        log.info("传入的值：{}", pageNum);

        List<Admin> list = adminService.list(pageNum);
        PageInfo<Admin> pageInfo = new PageInfo<>(list);

        return Result.success(pageInfo);
    }

    @PostMapping("addAdmin")
    public Result<Integer> addAdmin(@RequestBody Admin admin) {
        log.info("添加管理员，传入的值：{}", admin);

        String adminName = admin.getAdminName();
        Admin result = adminService.selectAdminByName(adminName);

        if (result != null)
            return Result.fail(ResultStatus.FAIL, 500, "用户名已存在");

        admin.setAdminPassword(MD5Util.toMD5(admin.getAdminPassword()));
        adminService.addAdmin(admin);

        return Result.success(ResultStatus.SUCCESS);
    }

    @DeleteMapping("deleteAdminById/{id}")
    public Result<Integer> deleteAdminById(@PathVariable Integer id) {
        log.info("删除的管理员 id：{}", id);

        adminService.deleteAdminById(id);

        return Result.success(ResultStatus.SUCCESS);
    }

    @GetMapping("selectAdminById/{id}")
    public Result<Admin> selectAdminById(@PathVariable Integer id) {
        log.info("查询管理员，传入的值：{}", id);

        Admin admin = adminService.selectAdminById(id);

        return Result.success(admin);
    }

    @PutMapping("updateAdminById")
    public Result<Integer> updateAdminById(@RequestBody Admin admin) {
        log.info("修改管理员信息，传入的值：{}", admin);

        adminService.updateAdminById(admin);

        return Result.success(ResultStatus.SUCCESS);
    }
}
