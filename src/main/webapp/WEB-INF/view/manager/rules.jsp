<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>政策法规</title>
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
    </style>
</head>
<body>
<%-- 图片、导航条 --%>
<jsp:include page="./commonTop.jsp"/>

<div class="container">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"> 添加政策法规</button>

    <table class="table table-hover">
        <thead>
        <th> id</th>
        <th> 标题</th>
        <th> 编辑</th>
        </thead>
        <tbody id="tbodyContent">

        </tbody>
    </table>
</div>

<%-- 添加物种政策法规模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加物种政策法规</h4>
            </div>
            <%-- 模态框内容处 --%>
            <div class="modal-body" id="modalContent">
                <div class="form-group col-md-12">
                    <label for="title">标题</label>
                    <input type="text" name="title" class="form-control" id="title">
                </div>
                <div class="form-group col-md-12">
                    <label for="container">内容</label>
                    <%-- 加载编辑器的容器。没有会报错 “Cannot read property 'style' of null” --%>
                    <script id="container" type="text/plain"></script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addRules()">保存</button>
            </div>
        </div>
    </div>
</div>

<%-- 修改物种政策法规模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改物种政策法规</h4>
            </div>
            <%-- 模态框内容处 --%>
            <div class="modal-body" id="modalContent">
                <input type="hidden" name="id" id="id">
                <div class="form-group col-md-12">
                    <label for="title">标题</label>
                    <input type="text" name="title2" class="form-control">
                </div>
                <div class="form-group col-md-12">
                    <label for="container">内容</label>
                    <%-- 加载编辑器的容器。没有会报错 “Cannot read property 'style' of null” --%>
                    <script id="containers" type="text/plain"></script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateRules()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<script>
    /* 初始化 */
    $(function () {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/rules/list",
            success: function (result) {
                var data = result.data;
                tableContent(data)
            }
        })
    });

    /* 拼接表格内容 */
    function tableContent(data) {
        var content = "";
        $.each(data, function (index, item) {
            content += '<tr>';
            content += '<td>' + item.id + '</td>';
            content += '<td>' + item.title + '</td>';
            content += '<td>';
            content += '<a class="btn btn-primary active" role="button" data-toggle="modal" data-target="#updateModal" onclick="selectRulesById(' + item.id + ')"> 修改 </a> ';
            content += ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteRulesById(' + item.id + ')"> 删除 </a>';
            content += '</td>';
            content += '</tr>';
        });
        $("#tbodyContent").html(content);
    }

    /* 修改前，查询内容回显 */
    function selectRulesById(id) {
        $("#id").val(id);
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/rules/selectRulesById/" + id,
            success: function (result) {
                var data = result.data;

                $(":input[name='title2']").val(data.title);
                ue2.setContent(data.content);
            }
        })
    }

    /* 修改物种保护动态 */
    function updateRules() {
        var id = $("#id").val();
        var title = $(":input[name='title2']").val();
        var content = ue2.getContent();

        if (title.length === 0 || content.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            id: id,
            title: title,
            content: content
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/rules/addRules",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                // 返回状态码
                var status = result.data;

                if (status === 200) {
                    layer.msg("添加成功", {time: 1500, icon: 1});
                    window.location.href = "${APP_PATH}/rules";
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        })
    };

    /* 添加物种保护动态 */
    function addRules() {
        var title = $(":input[name='title']").val();
        // uEditor富文本框中内容
        var content = ue.getContent();

        if (title.length === 0 || content.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            title: title,
            content: content
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/rules/addRules",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                // 返回状态码
                var status = result.data;

                if (status === 200) {
                    layer.msg("添加成功", {time: 1500, icon: 1});
                    window.location.href = "${APP_PATH}/rules";
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        })
    }

    /* 删除 */
    function deleteRulesById(id) {
        layer.confirm('是否删除政策法规：' + id, {
                //按钮
                btn: ['取消', '确定']
            }, function () {
                layer.msg('已取消...', {icon: 6, time: 1000});
            }, function () {
                $.ajax({
                    type: "DELETE",
                    url: "${APP_PATH}/rules/deleteRulesById/" + id,
                    success: function (result) {
                        var data = result.data;
                        if (data === 200) {
                            layer.msg("删除成功", {time: 1500, icon: 1});
                            window.location.href = "${APP_PATH}/rules";
                        } else {
                            layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                        }
                    }
                })
            }
        )
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

    /* 根据 containers区分，给更新物种保护动态使用 */
    var ue2 = UE.getEditor('containers', {
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
