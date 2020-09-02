package cn.hniu.service.impl;

import cn.hniu.mapper.TypeDetailsMapper;
import cn.hniu.pojo.TypeDetails;
import cn.hniu.service.TypeDetailsService;
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
public class TypeDetailsServiceImpl implements TypeDetailsService {

    @Autowired
    private TypeDetailsMapper typeDetailsMapper;

    @Override
    public int insertSelective(TypeDetails record) {
        int result = typeDetailsMapper.insertSelective(record);
        log.info("添加动物及描述信息，返回值：{}", result);

        return result;
    }

    @Override
    public TypeDetails selectByPrimaryKey(Integer id) {
        TypeDetails typeDetails = typeDetailsMapper.selectByPrimaryKey(id);
        log.info("查询描述信息，返回值：{}", typeDetails);

        return typeDetails;
    }

    @Override
    public int updateByPrimaryKeySelective(TypeDetails record) {
        int result = typeDetailsMapper.updateByPrimaryKeySelective(record);
        log.info("修改描述信息，返回值：{}", result);

        return result;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int result = typeDetailsMapper.deleteByPrimaryKey(id);
        log.info("删除动物详细信息，返回值：{}", id);

        return result;
    }

    @Override
    public List<TypeDetails> selectTypeDetailsByTypeId(Integer id) {
        List<TypeDetails> typeDetails = typeDetailsMapper.selectTypeDetailsByTypeId(id);
        log.info("根据类别 id查询信息：{}", typeDetails);

        return typeDetails;
    }
}
