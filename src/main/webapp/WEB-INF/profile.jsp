<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--<c: var="user" items="${user}">--%>
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <ul>
            <li><h1>${sessionScope.user.username}</h1></li>
            <li><h2>${sessionScope.user.firstName}</h2> <h2>${sessionScope.user.lastName}</h2></li>
            <li>${sessionScope.user.email}</li>
        </ul>
    </div>
<%--</c:>--%>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
