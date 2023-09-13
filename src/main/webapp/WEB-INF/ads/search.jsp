<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Search By Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="jd-profile-container">
    <c:forEach var="result" items="${results}">
        <div class="item cardAd" data-id="${result.id}">
            <p>${result.title}</p>
            <p>${result.user.username}</p>
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
