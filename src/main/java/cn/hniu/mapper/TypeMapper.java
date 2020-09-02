package cn.hniu.mapper;

import cn.hniu.pojo.Type;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

    // 查询全部类型
    @Select("SELECT id,type_name as typeName, image_url imageUrl FROM type")
    List<Type> list();

    List<Type> selectTypeAndTypeDetails();
}