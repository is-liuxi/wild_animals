package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 类别具体动物实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TypeDetails {
    private Integer id;

    private String animalName;

    private String imageUrl;

    private Integer typeId;

    private String content;

}