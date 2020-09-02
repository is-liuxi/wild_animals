package cn.hniu.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.DigestUtils;

import java.io.UnsupportedEncodingException;

/**
 * <p>
 * 密码进行 MD5加密
 * </p>
 *
 * @author: liuxi
 * @date: 2020/9/2
 */
@Slf4j
public class MD5Util {

    public static String toMD5(String pwd) {
        log.info("进行加密的值：{}", pwd);

        String result = null;
        try {
            result = DigestUtils.md5DigestAsHex(pwd.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static void main(String[] args) {
        System.out.println(toMD5("123456789"));
    }
}
