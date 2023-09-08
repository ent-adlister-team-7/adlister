<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
<c:forEach var="ads" items="${ads}">
<div class="${ads.id}">
    <ul>
        <li>project title: ${ads.title}</li>
        <li>description: ${ads.description}</li>
        <li>${ads.link}</li>
    </ul>
</div>
</c:forEach>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
