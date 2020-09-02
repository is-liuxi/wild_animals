package cn.hniu.service.impl;

import cn.hniu.common.Constants;
import cn.hniu.mapper.AdminMapper;
import cn.hniu.pojo.Admin;
import cn.hniu.service.AdminService;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(Admin admin) {
        Admin login = adminMapper.login(admin);

        log.info("登录的用户：{}", admin);

        return login;
    }

    @Override
    public List<Admin> list(Integer pageNum) {
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE);

        List<Admin> list = adminMapper.list();
        log.info("查询到的管理员信息：{}", list);

        return list;
    }

    @Override
    public Admin selectAdminByName(String adminName) {
        Admin admin = adminMapper.selectAdminByName(adminName);
        log.info("根据添加的管理员名，查询：{}", admin);

        return admin;
    }

    @Override
    public Integer addAdmin(Admin admin) {
        int result = adminMapper.insertSelective(admin);
        log.info("添加管理员，返回值：{}", result);

        return result;
    }

    @Override
    public Integer deleteAdminById(Integer id) {
        int result = adminMapper.deleteByPrimaryKey(id);
        log.info("删除管理员，返回值：{}", id);

        return result;
    }

    @Override
    public Admin selectAdminById(Integer id) {
        Admin admin = adminMapper.selectByPrimaryKey(id);
        log.info("查询后，返回值：{}", admin);

        return admin;
    }

    @Override
    public Integer updateAdminById(Admin admin) {
        int result = adminMapper.updateByPrimaryKeySelective(admin);
        log.info("修改管理员，返回值：{}", result);

        return result;
    }
}
