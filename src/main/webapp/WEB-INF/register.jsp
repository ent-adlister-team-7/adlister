<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <jsp:include page="partials/script.jsp"/>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<div class="title-bg">
    <h1 class="title">CREATE AN ACCOUNT...</h1>
</div>
<div class="reg-background">
<div class="container reg-container">
    <form action="/register" method="post">
        <div class="form-group">
            <label class="reg-label" for="username">USERNAME</label>
            <input id="username" name="username" class="form-control" type="text">
            <p id="usernameAvailabilityMessage" style="color: red;">
                <c:if test="${not empty requestScope.usernameTakenMessage}">
                    ${requestScope.usernameTakenMessage}
                </c:if>
            </p>
        </div>
        <div class="form-group">
            <label class="reg-label" for="email">EMAIL</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label class="reg-label" for="first_name">FIRST-NAME</label>
            <input id="first_name" name="first_name" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label class="reg-label" for="last_name">LAST-NAME</label>
            <input id="last_name" name="last_name" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label class="reg-label" for="password">PASSWORD</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label class="reg-label" for="confirm_password">CONFIRM PASSWORD</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn login comic-button">
    </form>
</div>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>
</body>
</html>
