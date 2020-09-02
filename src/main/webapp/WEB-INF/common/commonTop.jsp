<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    * {
        padding: 0px;
        margin: 0px;
    }

    body {
        background-color: #fff2d9;
    }

    /* top */
    #banner {
        background-image: url("${APP_PATH}/static/images/01.jpg");
        background-position: center;
        width: 100%;
        text-align: center;
    }

    /* 导航条 */
    nav {
        margin-top: 5px;
        padding: 0px;
    }

    .navbar {
        margin-bottom: 5px;
    }

    .navbar-inverse {
        background-color: #E69A17;
        border: 0px solid white;
    }

    .navbar-inverse .navbar-nav > li > a {
        color: white;
    }

    #navUl > li:hover {
        background-color: red;
    }

    #navUl > li {
        width: 90px;
        text-align: center;

    }

    #navUl > li > a {
        padding: 0px;
        display: block;
        height: 50px;
        line-height: 50px;
    }
    .container {
        padding: 0px;
    }

</style>

<%-- 图片 --%>
<div class="container" id="banner">
    <img src="${APP_PATH}/static/images/title.jpg" alt="图片不存在" id="title">
</div>

<%-- 导航条 --%>
<nav class="navbar navbar-inverse container">
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav" id="navUl">
            <li><a href="${APP_PATH}/main/index">专题首页</a></li>
        </ul>
    </div>
</nav>


<script>
    $(function () {
        /* 初始化导航条 */
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/type/list",
            success: function (result) {
                var navUl = "";

                var data = result.data;

                $.each(data, function (index, item) {
                    navUl += '<li><a href="${APP_PATH}/type/' + item.id + '">' + item.typeName + '</a></li>'
                });

                $("#navUl").append(navUl).append('<li><a href="${APP_PATH}/login">管理员登录</a></li>');

            }
        });
    })
</script>