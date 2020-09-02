package cn.hniu.service.impl;

import cn.hniu.mapper.ProtectionTrendsMapper;
import cn.hniu.pojo.ProtectionTrends;
import cn.hniu.service.ProtectionTrendsService;
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
 * @date: 2020/9/1
 */
@Service
@Slf4j
public class ProtectionTrendsServiceImpl implements ProtectionTrendsService {

    @Autowired
    private ProtectionTrendsMapper protectionTrendsMapper;

    @Override
    public int insertSelective(ProtectionTrends record) {
        int result = protectionTrendsMapper.insertSelective(record);
        log.info("添加物种动态信息，返回值：{}", result);

        return result;
    }

    @Override
    public List<ProtectionTrends> list() {
        List<ProtectionTrends> list = protectionTrendsMapper.list();
        log.info("查询标题、id动态信息，返回值：{}", list);

        return list;
    }

    @Override
    public ProtectionTrends selectByPrimaryKey(Integer id) {
        ProtectionTrends protectionTrends = protectionTrendsMapper.selectByPrimaryKey(id);
        log.info("根据 id查询，返回值：{}", protectionTrends);

        return protectionTrends;
    }

    @Override
    public int updateByPrimaryKeySelective(ProtectionTrends record) {
        int result = protectionTrendsMapper.updateByPrimaryKeySelective(record);
        log.info("更新物种动态管理，返回值：{}", result);

        return result;
    }

    @Override
    public Integer deleteProtectionTrend(Integer id) {
        int result = protectionTrendsMapper.deleteByPrimaryKey(id);
        log.info("删除物种保护动态，返回值：{}", result);

        return result;
    }

    @Override
    public List<ProtectionTrends> indexShow() {
        List<ProtectionTrends> protectionTrends = protectionTrendsMapper.indexShow();
        log.info("首页展示最新添加的五条物种保护动态：{}", protectionTrends);

        return protectionTrends;
    }

    @Override
    public ProtectionTrends selectProtectionTrendsById(Integer id) {
        ProtectionTrends protectionTrends = protectionTrendsMapper.selectByPrimaryKey(id);
        log.info("根据 id查询后结果：{}", protectionTrends);

        return protectionTrends;
    }
}
