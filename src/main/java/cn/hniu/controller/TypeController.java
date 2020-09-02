package cn.hniu.controller;

import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.Type;
import cn.hniu.service.TypeService;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 动物类别 Controller处理
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
@RestController
@RequestMapping("type")
@Slf4j
public class TypeController {

    @Autowired
    private TypeService typeService;

    @GetMapping("list")
    public Result<List<Type>> list() {
        List<Type> list = typeService.list();

        return Result.success(list, ResultStatus.SUCCESS);
    }

    @GetMapping("selectTypeAndTypeDetails")
    public Result<PageInfo<Type>> selectTypeAndTypeDetails(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        log.info("多表查询，传入的值，pageNum：{}", pageNum);

        List<Type> typeDetails = typeService.selectTypeAndTypeDetails(pageNum);

        // 封装 pageHelper的分页对象
        PageInfo<Type> page = new PageInfo<>(typeDetails);
        return Result.success(page, ResultStatus.SUCCESS);
    }
}
