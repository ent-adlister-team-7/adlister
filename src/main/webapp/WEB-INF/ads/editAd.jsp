<%--
  Created by IntelliJ IDEA.
  User: josedelaluz
  Date: 9/11/23
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit your ad</title>
</head>
<body>
<H1>Edit your ${ad.title}</H1>

<form action="/edit?id=${ad.id}" method="post">
    <input type="hidden" name="adId" value="${ad.id}">
    <h4>Title</h4>

        <label for="title">
            <input type="text" id="title" name="title" value="${ad.title}">
        </label>

    <h4>Link</h4>

        <label for="link">
            <input type="text" id="link" name="link" value="${ad.link}">
        </label>

    <h4>Description</h4>

        <label for="description">
            <input type="text" id="description" name="description" value="${ad.description}">
        </label>


    <button>SUBMIT</button>

</form>

</body>
</html>
