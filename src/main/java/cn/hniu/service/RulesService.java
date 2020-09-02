package cn.hniu.service;

import cn.hniu.pojo.Rules;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
public interface RulesService {

    List<Rules> list();

    Integer addRules(Rules rules);

    Rules selectRulesById(Integer id);

    Integer updateRules(Rules rules);

    Integer deleteRulesById(Integer id);

    List<Rules> indexShow();
}
