package cn.hniu.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>
 * 获取 ueditor富文本中的图片路径
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
public class ImgUtil {

    /*
    从HTML源码中提取图片路径，最后以一个 String 类型的 List 返回，如果不包含任何图片，则返回一个 size=0　的List
    提取常用格式的图片：.jpg|.bmp|.eps|.gif|.mif|.miff|.png|.tif|.tiff|.svg|.wmf|.jpe|.jpeg|.dib|.ico|.tga|.cut|.pic
     */
    public static List<String> getImageSrc(String htmlCode) {
        List<String> imageSrcList = new ArrayList<String>();
        // 正则匹配
        Pattern p = Pattern.compile("<img\\b[^>]*\\bsrc\\b\\s*=\\s*('|\")?([^'\"\n\r\f>]+(\\.jpg|\\.bmp|\\.eps|\\.gif|\\.mif|\\.miff|\\.png|\\.tif|\\.tiff|\\.svg|\\.wmf|\\.jpe|\\.jpeg|\\.dib|\\.ico|\\.tga|\\.cut|\\.pic)\\b)[^>]*>", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(htmlCode);
        String quote = null;
        String src = null;
        while (m.find()) {
            quote = m.group(1);
            src = (quote == null || quote.trim().length() == 0) ? m.group(2).split("\\s+")[0] : m.group(2);
            imageSrcList.add(src);
        }
        return imageSrcList;
    }

    public static void main(String[] args) {
        String str = "<p><img src=\"http://localhost:8081/animal/upload/image/20200831/1598810877413051544.png\" title=\"1598810877413051544.png\" alt=\"JMS编码总体架构.png\"/>这里写你的初始化内容</p>";
        String str1 = "<p><img src=\"http://localhost:8081/animal/upload/image/20200831/1598811853828082476.png\" title=\"1598811853828082476.png\" alt=\"架构区别.png\"/><img src=\"http://localhost:8081/animal/upload/image/20200831/1598811857725031600.png\" title=\"1598811857725031600.png\" alt=\"spring事务.png\"/>这里写你的初始化内容</p>";
        String str2 = "<p>adfaf<img src=\"http://localhost:8081/animal/upload/image/20200831/1598812450067026932.png\" title=\"1598812450067026932.png\" alt=\"Yarn架构.png\"/>这里写你的初始化内容</p>";
        List<String> imageSrc = ImgUtil.getImageSrc(str2);
        System.out.println(imageSrc);

        String s = StringUtil.listToString(imageSrc, ',');
        System.out.println(s);
    }
}
