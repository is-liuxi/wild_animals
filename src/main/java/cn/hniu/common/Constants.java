package cn.hniu.common;

/**
 * <p>
 *  常量，减少硬编码
 * </p>
 *
 * @author: liuxi
 * @date: 2020/8/31
 */
public interface Constants {

    // 上下文路径
    String APPLICATION_CONTEXT = "APP_PATH";

    // 登录用户信息
    String LOGIN_USER = "admin";

    // 分页，每页显示的大小
    Integer PAGE_SIZE = 5;

    // 法规、保护动态等内容，保存到域中的名称
    String CONTENT = "content";

    // 每个类别的名称，保存到域中
    String ANIMAL_NAME = "animalName";

    // 类别
    String TYPE_NAME = "type";

    // 兽类类别 id，防止修改后，多处需要修改
    // Integer BIRDS_ID = 1010;
}
