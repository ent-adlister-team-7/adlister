<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body class="cover-photo">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container col-lg-3">
    <img class="profilepic" src="../img/byteclub.jpeg">
</div>
<div>
    <div class="card profilecard">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <ul>
            <li><h2>${sessionScope.user.firstName}</h2>
                <h2>${sessionScope.user.lastName}</h2></li>
            <li>${sessionScope.user.email}</li>
        </ul>
    </div>
    <c:if test="${not empty sessionScope.user}">
        <c:choose>
            <c:when test="${sessionScope.user.id == user.id}">
                <form action="/editUser" method="get">
                    <input type="hidden" name="userid" value="${user.id}">
                    <input type="submit" value="Edit Profile">
                </form>
            </c:when>
        </c:choose>
    </c:if>


</div>
<c:forEach var="ads" items="${ads}">
<%--    <div class=" advertisement" data-id="${ads.id}">--%>
<%--        <ul>--%>
<%--            <li>project title: ${ads.title}</li>--%>
<%--            <li>description: ${ads.description}</li>--%>
<%--            <li>${ads.link}</li>--%>
<%--            <a href="/displayAd?id=${ads.id}">See Details</a>--%>
<%--        </ul>--%>
<%--    </div>--%>
    <div class="card cardAd" data-id="${ads.id}">
<%--        <div class="card-body">--%>
            <h5 class="card-title">${ads.title}</h5>
            <h6 class="card-subtitle">${ads.user.username}</h6>
            <p class="card-text">${ads.description}</p>
            <a href="#">${ads.link}</a>
            <br>
            <a href="/displayAd?id=${ads.id}" class="card-link">See Details</a>
<%--        </div>--%>
    </div>
</c:forEach>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>
</body>
</html>
