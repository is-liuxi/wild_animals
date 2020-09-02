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
    ul>li:hover{
        background-color: orangered;
    }
    .container {
        padding: 0px;
    }
</style>

<%-- 图片 --%>
<div class="container" id="banner">
    <img src="${APP_PATH}/static/images/title.jpg" alt="图片不存在" id="title">
</div>

<div class="container">
    <nav class="navbar navbar-inverse container">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li role="presentation" class="dropdown">
                    <a href="${APP_PATH}/manager/index">系统管理 </a>
                    <%--<ul class="dropdown-menu">
                        <li><a href="#">添加管理员</a></li>
                        <li><a href="#">查看管理员</a></li>
                    </ul>--%>
                </li>
                <li role="presentation" class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">物种信息管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${APP_PATH}/addAnimalPage">录入物种信息</a></li>
                        <li><a href="${APP_PATH}/animalsPag">查看物种信息</a></li>
                    </ul>
                </li>
                <li role="presentation" class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">物种保护措施管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%--<li><a href="#">国家级别自然保护区</a></li>
                        <li><a href="#">保护组织</a></li>--%>
                        <li><a href="${APP_PATH}/protectionTrends">保护动态</a></li>
                        <li><a href="${APP_PATH}/rules">政策法规</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="${APP_PATH}/manager/logout" aria-expanded="false">退出登录</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<script>
    $('.dropdown-toggle').dropdown()
</script>