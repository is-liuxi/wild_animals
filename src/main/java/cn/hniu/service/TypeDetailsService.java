package cn.hniu.service;

import cn.hniu.pojo.TypeDetails;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/1
 */
public interface TypeDetailsService {

    int insertSelective(TypeDetails record);

    TypeDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeDetails record);

    int deleteByPrimaryKey(Integer id);

    List<TypeDetails> selectTypeDetailsByTypeId(Integer id);
}
