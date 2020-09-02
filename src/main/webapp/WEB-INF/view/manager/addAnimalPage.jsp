<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加物种信息</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
</head>
<body>
<%-- 图片、导航条 --%>
<jsp:include page="./commonTop.jsp"/>

<%-- uEditor编辑框 --%>
<div class="container">
    <div class="form-group col-md-12">
        <label for="animalName">动物名称</label>
        <input type="email" name="animalName" class="form-control" id="animalName" placeholder="Tom">
    </div>
    <div class="form-group col-md-12">
        <label for="animalType">动物类别</label>
        <select class="form-control" name="typeId" id="animalType">

        </select>
    </div>
    <div class="form-group col-md-12">
        <label for="outline">简介</label>
        <%-- 加载编辑器的容器。没有会报错 “Cannot read property 'style' of null” --%>
        <script id="container" type="text/plain">请输入你添加的物种详细信息</script>
    </div>
    <div class="form-group col-md-12">
        <div class="col-md-offset-2 col-md-1">
            <button id="add" class="btn btn-success">提交</button>
        </div>
        <div class="col-md-2">
            <button id="reset" class="btn btn-danger">重置</button>
        </div>
    </div>
</div>

<script type="text/javascript">
    /* 初始化动物类别下拉框 */
    $(function(){
       $.ajax({
           type: "GET",
           url: "${APP_PATH}/type/list",
           success: function(result){
               console.log(result)
               var data = result.data;

               var content = "";

               $.each(data, function(index, item){
                   content += '<option value="'+item.id+'">'+item.typeName+'</option>';
               });

               $("#animalType").append(content);
           }
       })
    });

    <!--　实例化编辑器 -->
    var ue = UE.getEditor('container', {
        initialFrameWidth: '100%',
        toolbars: [
            [
                'fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough',
                'indent','blockquote', 'pasteplain', 'forecolor', 'backcolor',
                'cleardoc', 'removeformat', 'formatmatch','autotypeset', "preview"
            ],
            [
                'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'insertorderedlist', 'insertunorderedlist',
                'paragraph','customstyle','fontsize',  'simpleupload', 'insertimage', 'inserttable'

            ]
        ]
    });

    /* 添加动物以及描述信息 */
    $("#add").click(function () {
        var animalName = $("#animalName").val();
        var typeId = $("#animalType").val();
        // uEditor富文本框中内容
        var content = ue.getContent();

        if (animalName.length === 0 || content.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            animalName: animalName,
            typeId: typeId,
            content: content
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/typeDetails/addAnimal",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                // 返回状态码
                var data = result.status;

                if (data === 200) {
                    layer.msg("添加成功", {time: 1500, icon: 1});

                    $("#animalName").val();
                    ue.setContent("请输入你添加的物种详细信息");
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        })
    });
</script>
</body>
</html>
