package cn.hniu.mapper;

import cn.hniu.pojo.ProtectionTrends;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProtectionTrendsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProtectionTrends record);

    int insertSelective(ProtectionTrends record);

    ProtectionTrends selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProtectionTrends record);

    int updateByPrimaryKeyWithBLOBs(ProtectionTrends record);

    int updateByPrimaryKey(ProtectionTrends record);

    @Select("SELECT id, title, content FROM protection_trends")
    List<ProtectionTrends> list();

    @Select("SELECT id,title FROM protection_trends ORDER BY id DESC LIMIT 5")
    List<ProtectionTrends> indexShow();
}