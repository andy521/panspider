<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <title>叮叮搜索</title>
    <jsp:include page="include/commonfile.jsp"/>
    <style>
        .search-input {
            margin-top: 250px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/index">叮叮搜索</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${ctx}/index">百度云搜索 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${ctx}/about">关于</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="search-input">
        <div class="col-lg-10">
            <input type="text" class="form-control input-lg" id="input" placeholder="请输入关键词..." autofocus>
        </div>
        <div class="col-lg-2">
            <button type="button" class="btn btn-lg btn-success" id="submit">网盘搜索</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        $(document).keyup(function(event){
            if(event.keyCode ===13){
                $("#submit").trigger("click");
            }
        });
        $("#submit").on("click", function () {
            var $input = $("#input");
            var q = $input.val();
            if (q === null || q === undefined || q === '' || $.trim(q) === ''){
                layer.msg('请输入关键字!', { offset: 0, shift: 6 });
                $input.focus();
                return false;
            }
            window.location = "${ctx}/search?q=" + encodeURIComponent(q);
        });
    });

</script>

</body>
</html>