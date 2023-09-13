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
<%--<div class="profile-box-jd">--%>
<%--    <div>--%>
<%--        <img class="profilepic" src="../img/byteclub.jpeg">--%>
<%--    </div>--%>
<%--    <div class="card profilecard">--%>
<%--        <h1>Welcome, ${sessionScope.user.username}!</h1>--%>
<%--        <ul>--%>
<%--            <li><h2>${sessionScope.user.firstName}</h2>--%>
<%--                <h2>${sessionScope.user.lastName}</h2></li>--%>
<%--            <li>${sessionScope.user.email}</li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--    <c:if test="${not empty sessionScope.user}">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${sessionScope.user.id == user.id}">--%>
<%--                <form action="/editUser" method="get">--%>
<%--                    <input type="hidden" name="userid" value="${user.id}">--%>
<%--                    <input type="submit" value="Edit Profile">--%>
<%--                </form>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--    </c:if>--%>
<%--</div>--%>
<div class="profile-box-jd">
    <div class="profile-pic-container">
        <img class="profilepic" src="../img/byteclub.jpeg">
    </div>
    <div class="profile-content">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <div class="jd-white-border">
            <ul>
                <li><h2>${sessionScope.user.firstName} ${sessionScope.user.lastName}</h2></li>
                <li>
                    <h4>${sessionScope.user.email}<h4
                </li>
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
</div>

<br>

<div class="jd-profile-container">
    <c:forEach var="ads" items="${ads}">
        <div class="item cardAd" data-id="${ads.id}">
            <h1> ${ads.title}</h1>
            <p> ${ads.description}</p>
            <p>${ads.link}</p>
            <a href="/displayAd?id=${ads.id}">See Details</a>
        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/footer.jsp"/>
</body>
</html>
