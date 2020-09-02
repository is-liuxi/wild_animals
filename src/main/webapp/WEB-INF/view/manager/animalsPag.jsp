<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>物种信息</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
    <style>
        table {
            text-align: center;
        }

        .table {
            margin-bottom: 0px;
        }

        th {
            text-align: center;
        }

        table img {
            height: 49px;
        }

        .pagination {
            margin: 0px;
        }
    </style>
</head>
<body>

<%-- 图片、导航条 --%>
<jsp:include page="./commonTop.jsp"/>

<div class="container">
    <table class="table table-hover">
        <thead>
        <th> id</th>
        <th> 动物类别</th>
        <th> 动物名称</th>
        <th> 图片地址</th>
        <th> 编辑</th>
        </thead>
        <tbody id="tbodyContent">

        </tbody>
    </table>
    <nav aria-label="Page navigation" style="float: right; margin-right: 220px; margin-top: 0px;">
        <ul class="pagination" id="pageNav">

        </ul>
    </nav>
</div>

<%-- 用户显示修改数据的模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改物种信息</h4>
            </div>
            <%-- 模态框内容处 --%>
            <div class="modal-body" id="modalContent">
                <input type="hidden" name="id" id="id">
                <div class="form-group col-md-12">
                    <label for="animalName">动物名称</label>
                    <input type="text" name="animalName" class="form-control" id="animalName">
                </div>
                <div class="form-group col-md-12">
                    <label for="animalType">动物类别</label>
                    <select class="form-control" name="typeId" id="animalType">

                    </select>
                </div>
                <div class="form-group col-md-12">
                    <label for="outline">简介</label>
                    <%-- 加载编辑器的容器。没有会报错 “Cannot read property 'style' of null” --%>
                    <script id="container" type="text/plain"></script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateAnimalDetails()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/type/selectTypeAndTypeDetails",
            success: function (result) {
                var data = result.data;

                // 表格中内容展示
                tableContent(data);
                // 分页条
                navPageNums(data);
            }
        });
    });

    // 表格中内容展示 DOM元素操作封装
    function tableContent(data) {
        var content = "";
        $.each(data.list, function (index, item) {
            content += '<tr>';
            content += '<td>' + item.typeDetails[0].id + '</td>';
            content += '<td>' + item.typeName + '</td>';
            content += '<td>' + item.typeDetails[0].animalName + '</td>';
            content += '<td><a href="' + item.typeDetails[0].imageUrl + '" target="_blank"><img src="' + item.typeDetails[0].imageUrl + '" alt=""></a></td>';
            content += '<td>';
            content += '<a class="btn btn-primary active" role="button" data-toggle="modal" data-target="#myModal" onclick="selectAnimalDetailsById(' + item.typeDetails[0].id + ')"> 修改 </a> ';
            content += ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteAnimalDetails(' + item.typeDetails[0].id + ')"> 删除 </a>';
            content += '</td>';
            content += '</tr>';
        });
        $("#tbodyContent").html(content);
    }

    // 分页条 DOM元素操作封装
    function navPageNums(data) {
        var pageNavContent = "";
        // 分页条数据
        var navPageNums = data.navigatepageNums;
        for (var i = 0; i < navPageNums.length; i++) {
            if (navPageNums[i] === data.pageNum) {
                pageNavContent += '<li class="active"><a href="javascript:void(0)">' + navPageNums[i] + ' <span class="sr-only">(current)</span></a></li>';
            } else {
                pageNavContent += '<li><a href="javascript:void(0)" onclick="selectPage(' + navPageNums[i] + ')">' + navPageNums[i] + ' </a></li>';
            }
        }
        $("#pageNav").html(pageNavContent);
    }

    // 点击分页条查询
    function selectPage(pageNum) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/type/selectTypeAndTypeDetails?pageNum=" + pageNum,
            success: function (result) {
                var data = result.data;

                // 表格中内容展示
                tableContent(data);
                // 分页条
                navPageNums(data);
            }
        });
    }

    // 查看动物详情（修改之前先查询）
    function selectAnimalDetailsById(id) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/typeDetails/selectAnimalDetailsById/" + id,
            success: function (result) {
                var data = result.data;
                console.log(data)

                $("#id").val(data.id);
                $("#animalName").val(data.animalName);
                ue.setContent(data.content);
            }
        });

        /* 下拉框 */
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/type/list",
            success: function (result) {
                console.log(result)
                var data = result.data;

                var content = "";

                $.each(data, function (index, item) {
                    content += '<option value="' + item.id + '">' + item.typeName + '</option>';
                });

                $("#animalType").append(content);
            }
        })
    }

    /* 模态框更新 */
    function updateAnimalDetails() {
        var id = $("#id").val();
        var animalName = $("#animalName").val();
        var typeId = $("#animalType").val();
        // uEditor富文本框中内容
        var content = ue.getContent();

        if (animalName.length === 0 || content.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            id: id,
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
                    window.location.href = "${APP_PATH}/animalsPag";
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        })
    }

    /* 删除 */
    function deleteAnimalDetails(id) {
        layer.confirm('是否删除动物信息：' + id, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "DELETE",
                url: "${APP_PATH}/typeDetails/deleteByPrimaryKey/" + id,
                success: function (result) {
                    if (result.data === 200) {
                        window.location.href = "${APP_PATH}/animalsPag";

                        layer.msg('删除成功', {icon: 1});
                    }
                }
            })
        });
    }

    <!--　实例化编辑器和组件 -->
    var ue = UE.getEditor('container', {
        initialFrameWidth: '100%',
        toolbars: [
            [
                'fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough',
                'indent', 'blockquote', 'pasteplain', 'forecolor', 'backcolor',
                'cleardoc', 'removeformat', 'formatmatch', 'autotypeset', "preview"
            ],
            [
                'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'insertorderedlist', 'insertunorderedlist',
                'paragraph', 'customstyle', 'fontsize', 'simpleupload', 'insertimage', 'inserttable'

            ]
        ]
    });
</script>
</body>
</html>
