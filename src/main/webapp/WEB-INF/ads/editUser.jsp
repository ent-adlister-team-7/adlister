<%--
  Created by IntelliJ IDEA.
  User: josedelaluz
  Date: 9/12/23
  Time: 9:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit your Profile</title>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="jd-edit-container">
    <div class="jd-edit-row">
        <div class="jd-edit-col">
            <form action="/editUser?id=${user.id}" method="post">
                <H1 class="jd-edit-h">Edit ${user.username}'s profile</H1>
                <input type="hidden" name="userid" value="${user.id}">
                <h4 class="jd-edit-h">First name</h4>
                <label class="jd-edit-input-box" for="first name">
                    <input class="jd-edit-input" type="text" id="first name" name="firstname" value="${user.firstName}">
                </label>
                <h4 class="jd-edit-h">Last name</h4>
                <label class="jd-edit-input-box" for="lastname">
                    <input class="jd-edit-input" type="text" id="lastname" name="lastname" value="${user.lastName}">
                </label>
                <h4 class="jd-edit-h">username</h4>
                <label class="jd-edit-input-box" for="username">
                    <input class="jd-edit-input" type="text" id="username" name="username" value="${user.username}">
                </label>
                <h4 class="jd-edit-h">email</h4>
                <label class="jd-edit-input-box" for="email">
                    <input class="jd-edit-input" type="text" id="email" name="email" value="${user.email}">
                </label>
                <br>
                <label for="submit">
                    <button id="submit" class="comic-button">SUBMIT</button>
                </label>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp"/>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>