<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
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

<jsp:include page="./commonTop.jsp"/>

<div class="container">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal"> 添加管理员</button>

    <table class="table table-hover">
        <thead>
        <th> 管理员ID</th>
        <th> 管理员名称</th>
        <th> 注册时间</th>
        <th> 编辑</th>
        </thead>
        <tbody id="tbodyContent">

        </tbody>
    </table>

    <%-- 分页条 --%>
    <nav aria-label="Page navigation" style="float: right; margin-right: 220px; margin-top: 0px;">
        <ul class="pagination" id="pageNav">

        </ul>
    </nav>
</div>

<%-- 添加管理员模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="addModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加管理员信息</h4>
            </div>
            <%-- 模态框内容处 --%>
            <div class="modal-body" id="modalContent">
                <div class="form-group col-md-12">
                    <label for="adminName">用户名</label>
                    <input type="text" name="adminName" class="form-control" id="adminName">
                </div>
                <div class="form-group col-md-12">
                    <label for="adminPassword">密 码</label>
                    <input type="password" name="adminPassword" class="form-control" id="adminPassword">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addAdmin()">添加</button>
            </div>
        </div>
    </div>
</div>

<%--修改管理员模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改管理员信息</h4>
            </div>
            <%-- 模态框内容处 --%>
            <div class="modal-body" id="modalContent">
                <input type="hidden" id="id">
                <div class="form-group col-md-12">
                    <label for="name">用户名</label>
                    <input type="text" name="name" class="form-control" id="name" readonly>
                </div>
                <div class="form-group col-md-12">
                    <label for="pwd">密 码</label>
                    <input type="text" name="pwd" class="form-control" id="pwd">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateAdminById()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/manager/list",
            success: function (result) {
                var data = result.data;

                tableContent(data);
                navPageNums(data);
            }
        })
    });

    /* 添加管理员 */
    function addAdmin() {
        var adminName = $("#adminName").val();
        var adminPassword = $("#adminPassword").val();

        if (adminName.length === 0 || adminPassword.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            adminName: adminName,
            adminPassword: adminPassword
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/manager/addAdmin",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                var data = result.data;

                if (data === 200) {
                    layer.msg("添加成功", {time: 1500, icon: 1});
                    window.location.href = "${APP_PATH}/manager/index";
                } else if (data === 500) {
                    layer.msg('用户名已存在，请重新输入！！！', {time: 1500, icon: 5, shift: 6}, null);
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }
        })
    }

    /* 删除管理员 */
    function deleteAdminById(id) {
        layer.confirm('是否删除管理员：' + id, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "DELETE",
                url: "${APP_PATH}/manager/deleteAdminById/" + id,
                success: function (result) {
                    var data = result.data;

                    if (data === 200) {
                        layer.msg("删除管理员成功", {time: 1500, icon: 1});
                        window.location.href = "${APP_PATH}/manager/index";
                    } else {
                        layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                    }
                }
            })
        })
    }

    /* 分页条按钮查询 */
    function selectPage(pageNum) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/manager/list?pageNum=" + pageNum,
            success: function (result) {
                var data = result.data;

                tableContent(data);
                navPageNums(data);
            }
        })
    }

    /* 修改管理员信息，数据回显 */
    function selectAdminById(id) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/manager/selectAdminById/" + id,
            success: function (result) {
                var data = result.data;
                $("#id").val(data.id);
                $("#name").val(data.adminName);
            }
        })
    }

    /* 修改管理员 */
    function updateAdminById() {
        var id = $("#id").val();
        var adminName = $("#name").val();
        var adminPassword = $("#pwd").val();

        if (adminName.length === 0 || adminPassword.length === 0) {
            layer.msg('添加的内容不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            id: id,
            adminName: adminName,
            adminPassword: adminPassword
        };

        $.ajax({
            type: "PUT",
            url: "${APP_PATH}/manager/updateAdminById",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                var data = result.data;

                if (data === 200) {
                    layer.msg("修改成功", {time: 1500, icon: 1});
                    window.location.href = "${APP_PATH}/manager/index";
                } else {
                    layer.msg('服务器异常！！！', {time: 1500, icon: 5, shift: 6}, null);
                }
            }

        })
    }

    /* 表格 */
    function tableContent(data) {
        /* 表格内容展示 */
        var content = "";
        $.each(data.list, function (index, item) {
            content += '<tr>';
            content += '<td>' + item.id + '</td>';
            content += '<td>' + item.adminName + '</td>';
            content += '<td>' + item.createTime + '</td>';
            content += '<td>';
            content += '<a class="btn btn-primary active" role="button" data-toggle="modal" data-target="#updateModal" onclick="selectAdminById(' + item.id + ')"> 修改 </a> ';
            content += ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteAdminById(' + item.id + ')"> 删除 </a>';
            content += '</td>';
            content += '</tr>';
        });
        $("#tbodyContent").html(content);
    }

    /* 分页条 DOM */
    function navPageNums(data) {
        // 分页条
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

</script>
</body>
</html>
