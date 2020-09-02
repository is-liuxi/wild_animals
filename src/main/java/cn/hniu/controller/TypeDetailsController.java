package cn.hniu.controller;

import cn.hniu.common.Result;
import cn.hniu.common.ResultStatus;
import cn.hniu.pojo.TypeDetails;
import cn.hniu.service.TypeDetailsService;
import cn.hniu.util.ImgUtil;
import cn.hniu.util.StringUtil;
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
@RequestMapping("typeDetails")
@Slf4j
public class TypeDetailsController {

    @Autowired
    private TypeDetailsService typeDetailsService;

    @PostMapping("addAnimal")
    public Result<Integer> addAnimal(@RequestBody TypeDetails typeDetails) {
        log.info("添加动物及描述信息，客户端请求的值：{}", typeDetails);

        List<String> imageSrc = ImgUtil.getImageSrc(typeDetails.getContent());
        log.info("包含的图片集合：{}", imageSrc);

        String imageUrl = StringUtil.listToString(imageSrc, ',');
        log.info("拼接成字符串：{}", imageUrl);

        // 当上传多张图片时，只存储一张
        // imageUrl = imageUrl.substring(0, imageUrl.indexOf(","));
        typeDetails.setImageUrl(imageUrl);

        // 当传入参数 id为 null时，添加元素
        if (typeDetails.getId() == null) {
            typeDetailsService.insertSelective(typeDetails);
        } else {
            // 修改
            typeDetailsService.updateByPrimaryKeySelective(typeDetails);
        }

        return Result.success(null, ResultStatus.SUCCESS);
    }

    @GetMapping("selectAnimalDetailsById/{id}")
    public Result<TypeDetails> selectAnimalDetailsById(@PathVariable("id") Integer id) {
        log.info("查询详细信息，id：{}", id);
        TypeDetails typeDetails = typeDetailsService.selectByPrimaryKey(id);

        return Result.success(typeDetails, ResultStatus.SUCCESS);
    }

    @DeleteMapping("deleteByPrimaryKey/{id}")
    public Result<Integer> deleteByPrimaryKey(@PathVariable("id") Integer id) {
        log.info("被删除的动物 id：{}", id);

        typeDetailsService.deleteByPrimaryKey(id);

        return Result.success(ResultStatus.SUCCESS);
    }

}
