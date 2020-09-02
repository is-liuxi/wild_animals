package cn.hniu.service;

import cn.hniu.pojo.ProtectionTrends;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/1
 */
public interface ProtectionTrendsService {

    int insertSelective(ProtectionTrends record);

    List<ProtectionTrends> list();

    ProtectionTrends selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProtectionTrends record);

    Integer deleteProtectionTrend(Integer id);

    List<ProtectionTrends> indexShow();

    ProtectionTrends selectProtectionTrendsById(Integer id);
}
