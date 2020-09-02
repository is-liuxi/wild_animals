package cn.hniu.controller;

import cn.hniu.util.ImgUtil;
import cn.hniu.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
@RestController
@Slf4j
public class FileUplaodController {

    @PostMapping("add")
    public String fileUplaod(@RequestBody String ueditorContent){
        log.info("{}", ueditorContent);
        List list = ImgUtil.getImageSrc(ueditorContent);
        log.info("{}", list);
        String picturePath = StringUtil.listToString(list, ',');
        log.info("{}", picturePath);
        System.out.println("aaaa");
        return "success";
    }
}
