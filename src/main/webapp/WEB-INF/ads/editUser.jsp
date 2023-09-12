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
</head>
<body>
<H1>Edit${user.username}'s profile</H1>

<form action="/editUser?id=${user.id}" method="post">
    <input type="hidden" name="userid" value="${user.id}">
    <h4>First name</h4>

    <label for="first name">
        <input type="text" id="first name" name="firstname" value="${user.firstName}">
    </label>

    <h4>Last name</h4>

    <label for="lastname">
        <input type="text" id="lastname" name="lastname" value="${user.lastName}">
    </label>

    <h4>username</h4>

    <label for="username">
        <input type="text" id="username" name="username" value="${user.username}">
    </label>

    <h4>email</h4>

    <label for="email">
        <input type="text" id="email" name="email" value="${user.email}">
    </label>


    <button>SUBMIT</button>

</form>

</body>
</html>