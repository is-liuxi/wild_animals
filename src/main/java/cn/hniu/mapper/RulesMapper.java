package cn.hniu.mapper;

import cn.hniu.pojo.Rules;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RulesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Rules record);

    int insertSelective(Rules record);

    Rules selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Rules record);

    int updateByPrimaryKeyWithBLOBs(Rules record);

    int updateByPrimaryKey(Rules record);

    @Select("SELECT id, title, content FROM rules")
    List<Rules> list();

    /* 首页展示最新的五条相关法规 */
    @Select("SELECT id,title FROM rules ORDER BY id DESC LIMIT 5")
    List<Rules> indexShow();
}