<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="photo-cover">
    <div class="container hero-page">
        <h1 class="index-content">Welcome to the</h1>
    </div>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
