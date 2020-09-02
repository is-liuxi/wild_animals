<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>濒危物种信息</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
    <style>
        div > p:last-child {
            text-indent: 2em;
        }

        .col-md-9 {
            padding-left: 15px;
        }

        .col-md-3 {
            padding-left: 15px;
        }

        #leftText {
            background-color: #ffdc73;
        }

        #rightText {
            background-color: #e6ff99;
        }

        .container {
            padding: 0px;
        }

        .row {
            margin-right: 0px;
            margin-left: 0px;
        }

        h4 {
            height: 24px;
            line-height: 24px;
            width: 170px;
            text-align: center;
            color: white;
        }

        h5 {
            text-align: center;
            font-weight: bold;
        }

        #protect h5 {
            margin: 0px;
            text-align: left;
            font-weight: bold;
            height: 26px;
            line-height: 26px;
            color: white;
        }

        /* 文字背景图 */
        .bg1 {
            background-image: url("${APP_PATH}/static/images/bg.gif");
        }

        .bg2 {
            background-image: url("${APP_PATH}/static/images/bg2.png");

        }

        .bg3 {
            background-image: url("${APP_PATH}/static/images/bg3.png");
        }

        .bg4 {
            background-image: url("${APP_PATH}/static/images/bg4.png");
        }

        .bg5 {
            background-image: url("${APP_PATH}/static/images/bg5.png");
        }

        /* 缩略图 */
        .col-md-2, .col-md-4, .col-md-3 {
            padding-left: 0px;
        }

        .thumbnail .caption {
            padding: 0px;
        }

        #animalDetails > div:last-child img {
            width: 149px;
        }

        .thumbnail {
            margin-bottom: 5px;
        }

        .col-md-3 h5 {
            width: 220px;
        }

        ul {
            margin-top: 20px;
            margin-left: 20px;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: black;
        }

        #protect .thumbnail {
            height: 160px;
        }

        #image img{
            width: 270px;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/common/commonTop.jsp"/>

<%-- 简介 --%>
<div class="container">
    <div class="row">
        <div class="col-md-3" id="leftText">
            <p>
                <b>编者</b>
            </p>
            <p>
                从茹毛饮血中成长起来的人类,离不开对野生动物的利用,但过度捕杀野生动物将危及人类自身,因为每种动物都有它存在于自然界的生态地位和功能。它们和我们共同享有地球家园,真正的和平共处是各安其处、互不干扰。
            </p>
        </div>
        <div class="col-md-9" id="rightText">
            <p>
                <b>中国珍稀动物现状</b>
            </p>
            <p>
                中国是濒危动物分布大国。据不完全统计，仅列入《濒危野生动植物种国际贸易公约》附录的原产于中国的濒危动物有120多种(指原产地在中国的物种)，列入《国家重点保护野生动物名录》的有257种，列入《中国濒危动物红皮书》的鸟类、两栖爬行类和鱼类有400种，列入各省、自治区、直辖市重点保护野生动物名录的还有成百上千种。
                20世纪80年代以来，中国进口了不少动物，如湾鳄、暹罗鳄、食蟹猴、黑猩猩、非洲象等。这些外来的濒危动物，也受到国家的重点保护。由于我国人口众多，活动范围广，使许多珍贵的野生动物被迫退缩残存在边远的山区、森林、草原、沼泽、荒漠等地区，分布区极其狭窄。随着经济的持续快速发展和生态环境的日益恶化，中国的濒危动物种类还会增加。
            </p>
        </div>
    </div>
</div>

<%-- 中国珍惜野生动物栏位 --%>
<div class="container">
    <h4 class="bg1">中国珍惜野生动物</h4>
    <div class="row" id="animalDetails">

    </div>
</div>

<%-- 已灭绝的物种栏位 --%>
<div class="container">
    <h4 class="bg2">已灭绝的物种</h4>
    <div class="row">
        <div class="col-sm-4 col-md-4">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/2-1.png">
                <div class="caption">
                    <h5>世界</h5>
                    <p>
                        据世界《红皮书》统计，20世纪有110个种和亚种的哺乳动物以及139种和亚种的鸟类在地球上消失了。目前，世界上已有593种鸟、400多种兽、209种两栖爬行动物和20000多种高等植物濒于灭绝。
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/2-2.png">
                <div class="caption">
                    <h5>中国</h5>
                    <p>
                        据世界《红皮书》统计，20世纪有110个种和亚种的哺乳动物以及139种和亚种的鸟类在地球上消失了。目前，世界上已有593种鸟、400多种兽、209种两栖爬行动物和20000多种高等植物濒于灭绝。
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/2-3.png">
                <div class="caption">
                    <h5>第六次物种大灭绝正在进行</h5>
                    <p>
                        据世界《红皮书》统计，20世纪有110个种和亚种的哺乳动物以及139种和亚种的鸟类在地球上消失了。目前，世界上已有593种鸟、400多种兽、209种两栖爬行动物和20000多种高等植物濒于灭绝。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <h4 class="bg3">保护措施</h4>
    <div class="row" id="protect">
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <div class="caption">
                    <h5 class="bg2">国家级别自然保护区</h5>
                    <ul>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/04/content_16896277.htm">
                                中国华北地区
                            </a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/04/content_16896325.htm">
                                中国华东地区
                            </a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/04/content_16896326.htm">
                                中国华中地区
                            </a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/04/content_16896327.htm">
                                中国华南地区
                            </a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/04/content_16896371.htm">
                                中国西南地区
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <div class="caption">
                    <h5 class="bg3">保护组织</h5>
                    <ul>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/08/content_16915955.htm">中国野生动物保护协会</a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/08/content_16915905.htm">国际爱护动物基金会</a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/08/content_16916060.htm">拯救中国虎国际基金会</a>
                        </li>
                        <li>
                            <a href="http://www.china.com.cn/aboutchina/zhuanti/ysdw/2008-12/08/content_16915777.htm">野生动物保护协会</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <div class="caption">
                    <h5 class="bg4">相关法规</h5>
                    <ul id="rulesContent">

                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <div class="caption">
                    <h5 class="bg5">保护动态</h5>
                    <ul id="protectContent">

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container" id="image">
    <h4 class="bg1">珍稀动物图片</h4>
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-1.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-2.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-3.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-4.png">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-5.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-6.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-7.png">
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="thumbnail">
                <img src="${APP_PATH}/static/images/3-8.png">
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        /* 初始化导航条 */
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/type/list",
            success: function (result) {
                var data = result.data;

                var content = "";
                $.each(data, function (index, item) {
                    content += '<div class="col-sm-3 col-md-2">';
                    content += '<div class="thumbnail">';
                    content += '<a href="${APP_PATH}/type/' + item.id + '"><img src="${APP_PATH}' + item.imageUrl + '"></a>';
                    content += '<div class="caption">';
                    content += '<h5>' + item.typeName + '</h5>';
                    content += '</div>';
                    content += '</div>';
                    content += '</div>';
                });

                $("#animalDetails").append(content);
            }
        });

        /* 物种保护-相关政策 */
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/rules/indexShowRules",
            success: function (result) {
                var data = result.data;

                var content = "";

                $.each(data, function (index, item) {
                    content += '<li>';
                    content += '<a href="${APP_PATH}/rules/' + item.id + '" target="_block">' + item.title + '</a>';
                    content += '</li>';
                });

                $("#rulesContent").append(content);
            }
        });

        /* 物种保护-保护动态 */
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/protectionTrends/indexShowProtectionTrends",
            success: function (result) {
                var data = result.data;

                var content = "";

                $.each(data, function (index, item) {
                    content += '<li>';
                    content += '<a href="${APP_PATH}/protectionTrends/' + item.id + '" target="_block">' + item.title + '</a>';
                    content += '</li>';
                });

                $("#protectContent").append(content);
            }
        })
    })
</script>
</body>
</html>
