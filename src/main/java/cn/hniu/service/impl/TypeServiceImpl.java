package cn.hniu.service.impl;

import cn.hniu.common.Constants;
import cn.hniu.mapper.TypeMapper;
import cn.hniu.pojo.Type;
import cn.hniu.service.TypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
 * @date: 2020/8/31
 */
@Service
@Slf4j
public class TypeServiceImpl implements TypeService {

   @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Type> list() {
        List<Type> list = typeMapper.list();
        log.info("动物类别，查询全部：{}", list);

        return list;
    }

    @Override
    public List<Type> selectTypeAndTypeDetails(Integer pageNum) {
        PageHelper.startPage(pageNum, Constants.PAGE_SIZE);
        List<Type> details = typeMapper.selectTypeAndTypeDetails();
        log.info("动物类别与详细表，查询到的值：{}", details);

        return details;
    }

    @Override
    public Type selectByPrimaryKey(Integer id) {
        Type type = typeMapper.selectByPrimaryKey(id);
        log.info("根据 id查询到的类型：{}", type);

        return type;
    }
}
