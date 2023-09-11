<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
<c:forEach var="ads" items="${ads}">
    <div class=" advertisement" data-id="${ads.id}">
        <ul>
            <li>project title: ${ads.title}</li>
            <li>description: ${ads.description}</li>
            <li>${ads.link}</li>
            <a href="/displayAd?id=${ads.id}">See Details</a>
        </ul>
    </div>
</c:forEach>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
<jsp:include page="/WEB-INF/partials/script.jsp" />
<script src=""></script>
</body>
</html>
