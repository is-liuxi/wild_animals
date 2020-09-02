package cn.hniu.service.impl;

import cn.hniu.mapper.RulesMapper;
import cn.hniu.pojo.Rules;
import cn.hniu.service.RulesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class RulesServiceImpl implements RulesService {

    @Autowired
    private RulesMapper rulesMapper;

    @Override
    public List<Rules> list() {
        List<Rules> list = rulesMapper.list();
        log.info("查询政策法规，返回值：{}", list);

        return list;
    }

    @Override
    public Integer addRules(Rules rules) {
        int result = rulesMapper.insertSelective(rules);
        log.info("添加政策法规，返回值：{}", result);

        return result;
    }

    @Override
    public Rules selectRulesById(Integer id) {
        Rules rules = rulesMapper.selectByPrimaryKey(id);
        log.info("根据 id查询政策法规，返回值：{}", rules);

        return rules;

    }

    @Override
    public Integer updateRules(Rules rules) {
        int result = rulesMapper.updateByPrimaryKeySelective(rules);
        log.info("修改政策法规，返回值：{}", result);

        return result;
    }

    @Override
    public Integer deleteRulesById(Integer id) {
        int result = rulesMapper.deleteByPrimaryKey(id);
        log.info("删除政策法规，返回值：{}", result);

        return result;
    }

    @Override
    public List<Rules> indexShow() {
        List<Rules> rules = rulesMapper.indexShow();
        log.info("首页展示最新的政策法规：{}", rules);

        return rules;
    }
}
