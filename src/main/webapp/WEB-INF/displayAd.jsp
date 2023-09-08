<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Display</title>
</head>
<body>
<h1>DisplayAd</h1>
<div>
<c:forEach var="ads" items="${ads}">
    <c:forEach var="users" items="${users}">
        <ul>
        <ul> Username: ${users.username}</ul>
    </c:forEach>
    <li>project title: ${ads.title}</li>
    <li>description: ${ads.description}</li>
    <li>${ads.link}</li>
    </ul>
</c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
