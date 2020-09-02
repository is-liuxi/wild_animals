package cn.hniu.controller;

import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.Rules;
import cn.hniu.service.RulesService;
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
 * @date: 2020/9/2
 */
@RestController
@Slf4j
@RequestMapping("rules")
public class RulesController {

    @Autowired
    private RulesService rulesService;

    @GetMapping("list")
    public Result<List<Rules>> list() {
        List<Rules> list = rulesService.list();

        return Result.success(list, ResultStatus.SUCCESS);
    }

    @PostMapping("addRules")
    public Result<Integer> addRules(@RequestBody Rules rules) {
        log.info("添加政策法规，前端传入的值：{}", rules);

        if (rules.getId() == null)
            rulesService.addRules(rules);
        else
            rulesService.updateRules(rules);

        return Result.success(ResultStatus.SUCCESS);
    }

    @GetMapping("selectRulesById/{id}")
    public Result<Rules> selectRulesById(@PathVariable Integer id) {
        Rules rules = rulesService.selectRulesById(id);

        return Result.success(rules);
    }

    @DeleteMapping("deleteRulesById/{id}")
    public Result<Integer> deleteRulesById(@PathVariable("id") Integer id) {
        log.info("删除政策法规，传入的值：{}", id);

        rulesService.deleteRulesById(id);

        return Result.success(ResultStatus.SUCCESS);
    }

    @GetMapping("indexShowRules")
    public Result<List<Rules>> indexShowRules() {
        List<Rules> rules = rulesService.indexShow();

        return Result.success(rules);
    }
}
