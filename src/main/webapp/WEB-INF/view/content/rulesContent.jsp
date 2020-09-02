<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>内容显示</title>
    <jsp:include page="/WEB-INF/common/commonCSS.jsp"/>
    <jsp:include page="/WEB-INF/common/commonJS.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/common/commonTop.jsp"/>

<div class="container" style="background-color: white;">
    ${content.content}
</div>
</body>
</html>
