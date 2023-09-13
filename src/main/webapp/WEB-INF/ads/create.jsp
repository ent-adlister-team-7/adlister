<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="title-bg">
            <h1 class="title">Create a new Ad</h1>
        </div>
<div class="reg-background">
    <div class="container reg-container">
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label class="reg-label" for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label  class="reg-label" for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label  class="reg-label" for="link">Link</label>
                <textarea id="link" name="link" class="form-control" type="text"></textarea>
            </div>
            <input type="submit" class="btn comic-button">
        </form>
    </div>
</div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
