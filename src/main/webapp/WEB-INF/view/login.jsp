<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        body {
            /* 背景图片透明度 */
            background: url("${APP_PATH}/static/images/login.jpg") no-repeat 0 0 transparent;
            /* 将背景图片等比缩放填满整个容器 */
            background-size: 100% 100%;
            overflow: hidden;
        }

        .form-inline {
            margin-top: 150px;
        }
    </style>
</head>
<body>
<div class="container">
    <form class="form-inline" onsubmit="return false">
        <div class="form-group">
            <label for="adminName">用户名</label>
            <input type="text" class="form-control" value="admin" name="adminName" id="adminName" placeholder="Tom">
        </div>
        <div class="form-group">
            <label for="adminPassword">密码</label>
            <input type="password" class="form-control" value="123456789" name="adminPassword" id="adminPassword">
        </div>
        <%--<div class="form-group">
            <label class="radio-inline">
                <input type="radio" name="type" id="user" value="user" checked> 用户
            </label>
            <label class="radio-inline">
                <input type="radio" name="type" id="admin" value="admin"> 管理员
            </label>
        </div>--%>

        <button type="submit" class="btn btn-success" id="login"> 登录</button>
    </form>
</div>

<script>
    $("#login").click(function () {
        var adminName = $("#adminName").val();
        var adminPassword = $("#adminPassword").val();

        var data = {
            adminName: adminName,
            adminPassword: adminPassword
        };

        if (adminName.length === 0 || adminPassword.length === 0) {
            layer.msg('用户名或者密码不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/manager/login",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                var data = result.data;

                if (data === 200) {
                    layer.msg("登录成功", {time: 1500, icon: 1});
                    window.location.href = "${APP_PATH}/manager/index";
                } else if (data === 500) {
                    layer.msg('用户名或者密码错误！！！', {time: 1500, icon: 5, shift: 6}, null);
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        });


    });
</script>
</body>
</html>
