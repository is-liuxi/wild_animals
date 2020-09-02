package cn.hniu.common;

import lombok.Data;

import java.util.List;

/**
 * <p>
 * Controller返回值
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
@Data
public class Result<T> {

    private Result(T data, Integer status) {
        this.data = data;
        this.status = status;
    }

    private Result(T data) {
        this.data = data;
    }

    private Result(T data, Integer status, String message) {
        this.data = data;
        this.status = status;
        this.message = message;
    }

    // 状态码
    private Integer status;

    // 返回数据
    private T data;

    // 描述信息
    private String message;

    // 成功
    public static <T> Result<T> success(T data) {

        return new Result<>(data);
    }

    public static <T> Result<T> success(T data, Integer status) {

        return new Result<>(data, status);
    }

    // 失败
    public static <T> Result<T> fail(T data, Integer status, String message) {

        return new Result<>(data, status, message);
    }
}
