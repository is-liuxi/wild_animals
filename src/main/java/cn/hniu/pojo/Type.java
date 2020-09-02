package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 类别
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {
    private Integer id;

    private String typeName;

    private String imageUrl;

    private List<TypeDetails> typeDetails;
}