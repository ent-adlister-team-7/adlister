<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/head.jsp" />
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<c:forEach var="ads" items="${ads}">
    <div class="advertisement card cardAd" data-id="${ads.id}">
        <ul class="ultext">
            <li class="viewprofile">Project Title: ${ads.title}</li>
            <li class="viewprofile">Description: ${ads.description}</li>
            <li class="viewprofile">${ads.link}</li>
            <a href="/displayAd?id=${ads.id}">See Details</a>
        </ul>
    </div>
</c:forEach>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
<jsp:include page="/WEB-INF/partials/script.jsp" />
<script src=""></script>
</body>
</html>
