<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- jstl --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>动物内容</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        body {
            background-color: #fff2d9;
        }

        .row {
            margin: 0px;
        }

        #left > h4 {
            background-image: url("${APP_PATH}/static/images/bg3.png");
            height: 26px;
            line-height: 26px;
            text-align: center;
            color: white;
        }

        #left li {
            list-style: none;
            text-align: center;
        }

        #left a {
            text-decoration: none;
            display: block;
            width: 160px;
            height: 30px;
            line-height: 30px;
        }

        #left a:hover {
            background-color: red;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/common/commonTop.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-2" id="left">
            <h4>${type.typeName}</h4>
            <ul>
                <c:forEach var="item" items="${animalName}">
                    <li>
                        <a href="javascript:void(0)" onclick="selectBirdsById(${item.id})">${item.animalName}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-10" style="background-color: white;" id="rightContent">

        </div>
    </div>
</div>

<script>
    $(function () {
        $.ajax({
            type: "GET",
            /* 页面初始化，默认显示第一个动物内容 */
            url: "${APP_PATH}/typeDetails/selectAnimalDetailsById/" + ${animalName[0].id},
            success: function (result) {
                console.log(result)
                var content = result.data.content;

                $("#rightContent").html(content);
            }
        });
    });

    /* 点击动物名称，查看详细信息 */
    function selectBirdsById(id) {
        $.ajax({
            type: "GET",
            /* 页面初始化，默认显示第一个动物内容 */
            url: "${APP_PATH}/typeDetails/selectAnimalDetailsById/" + id,
            success: function (result) {
                var content = result.data.content;

                $("#rightContent").html(content);
            }
        });
    }
</script>
</body>
</html>
