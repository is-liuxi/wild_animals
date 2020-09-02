package cn.hniu.util;

import java.util.List;

/**
 * <p>
 * 将 list转换为 String
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
public class StringUtil {

    public static String listToString(List list, char separator) {
        if (list.size() == 0)
            return null;

        // 使用 StringBuilder拼接字符串，效率高。String是不可变的字符串
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i)).append(separator);
        }
        return sb.toString().substring(0, sb.toString().length() - 1);
    }
}
