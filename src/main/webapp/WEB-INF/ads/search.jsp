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
                <p>${result.title}</p>
                <p>${result.description}</p>
                <a herf="#">${result.link}</a>
            <br>
                <a href="/displayAd?id=${result.id}">See Details</a>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
