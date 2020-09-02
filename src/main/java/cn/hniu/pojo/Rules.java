package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 相关法规
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rules {
    private Integer id;

    private String title;

    private String content;

}