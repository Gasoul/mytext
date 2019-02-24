<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/Index2.css" rel="stylesheet"/>
</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">
        <h4>数据列表</h4>
        <div>
            <form action="/cust/find.shtml" method="post">
                <div class="uinArea" id="uinArea">
                    客户名称：
                    <input type="text" value="${customer.custName}" name="cust_name" class="inputstyle"/>
                    客户类型：
                    <input type="text" value="${customer.custType}" name="cust_type" class="inputstyle"/>
                    <button type="submit" style="width:60px;" class="button_blue">查询</button>
                </div>
            </form>
        </div>
        <div class="add"><a class="btn btn-success" onclick="openadd();">新增</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>客户名称</th>
                        <th>客户类型</th>
                        <th>客户电话</th>
                        <th>客户地址</th>
                        <th>所属用户角色</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <c:forEach items="${custs}" var="cust">
                        <tr>
                            <td>${cust.cust_name}</td>
                            <td>${cust.cust_type}</td>
                            <td>${cust.cust_phone}</td>
                            <td>${cust.cust_address}</td>
                            <td>${cust.rolename}</td>
                            <td><a href="/cust/delete.shtml?cid=${cust.cid}">删除</a></td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
                <div id="page" class="tr"></div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">添加客户</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_form" action="/cust/add.shtml" method="post">
                    <div class="control-group">
                        <label class="control-label" for="cust_name">客户名称</label>
                        <div class="controls">
                            <input type="text" id="cust_name" name="cust_name" placeholder="客户名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cust_type">客户类型</label>
                        <div class="controls">
                            <input type="text" id="cust_type" name="cust_type" placeholder="客户类型">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cust_phone">客户电话</label>
                        <div class="controls">
                            <input type="text" id="cust_phone" name="cust_phone" placeholder="客户电话">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cust_address">客户地址</label>
                        <div class="controls">
                            <input type="text" id="cust_address" name="cust_address" placeholder="客户地址">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cust_link_user">所属用户角色</label>
                        <div class="controls">
                            <select name="cust_link_user" id="cust_link_user" placeholder="所属用户角色">
                                <%--<c:forEach items="tableUsers" var="u">--%>
                                    <%--<option value="${u.uid}">${u.username}</option>--%>

                                <%--</c:forEach>--%>
                                    <option value="1">超级管理员</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="add">保存</button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function openadd() {
        $("#myModalLabel").text("添加用户");
        $("#userName").attr("readonly", false);
        $("input").val("");
        $("#addModal").modal("show");
        $("#add").show();
        $("#edt").hide();
    }

    $("#add").click(function () {
        if($("#cust_name").val() == null || $("#cust_name").val() == ""){
            alert("客户名称不能为空")
        }else if($("#cust_type").val() == null || $("#cust_type").val() == ""){
            alert("客户类型不能为空")
        }else if($("#cust_phone").val() == null || $("#cust_phone").val() == ""){
            alert("客户电话不能为空")
        }else if($("#cust_address").val() == null || $("#cust_address").val() == ""){
            alert("客户地址不能为空")
        }else if($("#cust_link_user").val() == null || $("#cust_link_user").val() == ""){
            alert("所属用户角色不能为空")
        }else {
            $("#add_form").submit()
        }
    })



</script>
</body>
</html>