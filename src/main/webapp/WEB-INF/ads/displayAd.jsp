<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Display</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<h1>Display Ad</h1>
<div>
    <h1>${ad.title}</h1>
    <h2><a href="${ad.link}" target="_blank">${ad.link}</a></h2>
    <%-- <img src="${ad.imageSource}">--%>
    <p>${ad.description}</p>
    <c:if test="${not empty sessionScope.user}">
        <c:choose>
        <c:when test="${ad.user.id == sessionScope.user.id}">
            <form action="/delete" method="post">
                <input type="hidden" name="adId" value="${ad.id}">
                <input type="submit" value="Delete Ad">
            </form>
        </c:when>
        <c:otherwise>
            <p>You do not have permission to delete this ad.</p>
        </c:otherwise>
    </c:choose>
    </c:if>



</div>
<jsp:include page="/WEB-INF/partials/script.jsp" />
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
