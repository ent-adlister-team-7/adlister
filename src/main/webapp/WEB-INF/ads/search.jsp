<%--
  Created by IntelliJ IDEA.
  User: presleyblack
  Date: 9/8/23
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search By Title</title>
</head>
<body>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/search" method="post">
        <div class="form-group">
            <label for="search">Title</label>
            <input id="search" name="search" class="form-control" type="text">
        </div>
        <input type="submit" value="search" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
