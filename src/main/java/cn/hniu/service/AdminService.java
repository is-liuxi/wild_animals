package cn.hniu.service;

import cn.hniu.pojo.Admin;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
public interface AdminService {

    Admin login(Admin admin);

    List<Admin> list(Integer pageNum);

    Admin selectAdminByName(String adminName);

    Integer addAdmin(Admin admin);

    Integer deleteAdminById(Integer id);

    Admin selectAdminById(Integer id);

    Integer updateAdminById(Admin admin);
}
