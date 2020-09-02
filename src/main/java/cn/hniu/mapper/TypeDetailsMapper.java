package cn.hniu.mapper;

import cn.hniu.pojo.TypeDetails;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TypeDetailsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TypeDetails record);

    int insertSelective(TypeDetails record);

    TypeDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeDetails record);

    int updateByPrimaryKeyWithBLOBs(TypeDetails record);

    int updateByPrimaryKey(TypeDetails record);

    @Select("SELECT id, animal_name as animalName FROM type_details WHERE type_id = #{id}")
    List<TypeDetails> selectTypeDetailsByTypeId(Integer id);
}