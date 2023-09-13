<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AD Details</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/head.jsp"/>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<c:forEach var="ads" items="${ads}">
    <div class="card advertisement cardAd" data-id="${ads.id}">
        <div class="card-body">
            <h5 class="card-title">${ads.title}</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">${ads.user.username}</h6>
            <p class="card-text">${ads.description}</p>
            <a href="#">${ads.link}</a>
            <br>
            <a href="/displayAd?id=${ads.id}" class="card-link">See Details</a>
        </div>
    </div>
</c:forEach>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
<script src=""></script>
</body>
</html>
