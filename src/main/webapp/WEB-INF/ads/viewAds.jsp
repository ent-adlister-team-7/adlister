<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
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
</body>
</html>
