<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Display</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<%--<div class="container">--%>
<div class="jd-profile-container">
    <div class="item">
        <h1>${ad.user.username}</h1>
        <p>${ad.title}</p>
        <p>Link: <a href="http://${ad.link}" target="_blank">${ad.link}</a></p>
        <p>${ad.description}</p>
        <c:if test="${not empty sessionScope.user}">
            <c:choose>
                <c:when test="${ad.user.id == sessionScope.user.id}">
                    <form class="display-ad-jd" action="/delete" method="post">
                        <input type="hidden" name="adId" value="${ad.id}">
                        <input type="submit" value="Delete Ad">
                    </form>
                    <form class="display-ad-jd" action="/edit" method="get">
                        <input type="hidden" name="adId" value="${ad.id}">
                        <input type="submit" value="Edit Ad">
                    </form>
                </c:when>
                <c:otherwise>
                    <p>You do not have permission to delete this ad.</p>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>
</div>

<%--</div>--%>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>
</body>
</html>
