package cn.hniu.controller;

import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.ProtectionTrends;
import cn.hniu.pojo.Rules;
import cn.hniu.service.ProtectionTrendsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/1
 */
@RestController
@Slf4j
@RequestMapping("protectionTrends")
public class ProtectionTrendsController {

    @Autowired
    private ProtectionTrendsService protectionTrendsService;

    @PostMapping("addProtectionTrend")
    public Result<Integer> addProtectionTrend(@RequestBody ProtectionTrends protectionTrends) {
        log.info("添加物种保护动态，请求的值：{}", protectionTrends);

        if (protectionTrends.getId() == null)
            protectionTrendsService.insertSelective(protectionTrends);
        else
            protectionTrendsService.updateByPrimaryKeySelective(protectionTrends);

        return Result.success(ResultStatus.SUCCESS);
    }

    @GetMapping("list")
    public Result<List<ProtectionTrends>> list() {
        List<ProtectionTrends> list = protectionTrendsService.list();

        return Result.success(list, ResultStatus.SUCCESS);
    }

    @GetMapping("selectProtectionTrendsById/{id}")
    public Result<ProtectionTrends> selectProtectionTrendsById(@PathVariable("id") Integer id) {
        log.info("查询的 id值：{}", id);
        ProtectionTrends protectionTrends = protectionTrendsService.selectByPrimaryKey(id);

        return Result.success(protectionTrends, ResultStatus.SUCCESS);
    }

    @DeleteMapping("deleteProtectionTrend/{id}")
    public Result<Integer> deleteProtectionTrend(@PathVariable Integer id) {
        log.info("删除物种保护动态，传入的值：{}", id);
        protectionTrendsService.deleteProtectionTrend(id);

        return Result.success(ResultStatus.SUCCESS);
    }

    @GetMapping("indexShowProtectionTrends")
    public Result<List<ProtectionTrends>> indexShowProtectionTrends() {
        List<ProtectionTrends> rules = protectionTrendsService.indexShow();

        return Result.success(rules);
    }
}
