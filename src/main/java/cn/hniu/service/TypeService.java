package cn.hniu.service;

import cn.hniu.pojo.Type;

import java.util.List;

/**
 * <p>
 *  动物类别
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
public interface TypeService {

    List<Type> list();

    List<Type> selectTypeAndTypeDetails(Integer pageNum);

    Type selectByPrimaryKey(Integer id);

}
