<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
<c:forEach var="ad" items="${ads}">
    <ul>
        <ul> Username: ${ad.user.username}</ul>
        <li>project title: ${ad.title}</li>
        <li>link: ${ad.link}</li>
        <li>ad description: ${ad.description}</li>
    </ul>
</c:forEach>
</body>
</html>
