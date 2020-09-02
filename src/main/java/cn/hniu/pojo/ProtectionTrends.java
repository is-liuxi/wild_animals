package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 物种保护动态
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProtectionTrends {
    private Integer id;

    private String title;

    private String content;

}