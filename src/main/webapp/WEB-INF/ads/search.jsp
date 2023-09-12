<%--
  Created by IntelliJ IDEA.
  User: presleyblack
  Date: 9/8/23
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Search By Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Projects</h1>
    <c:forEach var="result" items="${results}">
        <div class="advertisement card cardAd" data-id="${result.id}">
            <ul class="ultext">
                <li>Project Title: ${result.title}</li>
                <li>Description: ${result.description}</li>
                <li>${result.link}</li>
                <a href="/displayAd?id=${result.id}">See Details</a>
            </ul>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
