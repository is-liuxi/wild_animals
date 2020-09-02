package cn.hniu.mapper;

import cn.hniu.pojo.Admin;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    @Select("SELECT id,admin_name adminName, admin_password adminPassword FROM admin WHERE admin_name = #{adminName} AND admin_password = #{adminPassword}")
    Admin login(Admin admin);

    @Select("SELECT id,admin_name adminName, admin_password adminPassword, create_time createTime FROM admin")
    List<Admin> list();

    @Select("SELECT * FROM admin WHERE admin_name = #{adminName}")
    Admin selectAdminByName(String adminName);
}