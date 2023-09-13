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
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="jd-edit-container">
    <div class="jd-edit-row">
        <div class="jd-edit-col">
            <form action="/edit?id=${ad.id}" method="post">
                <H1 class="jd-edit-h">Edit your ${ad.title}</H1>
                <input type="hidden" name="adId" value="${ad.id}">
                <h4 class="jd-edit-h">Title</h4>
                <label class="jd-edit-input-box" for="title">
                    <input class="jd-edit-input" type="text" id="title" name="title" value="${ad.title}">
                </label>
                <h4 class="jd-edit-h">Link</h4>
                <label class="jd-edit-input-box" for="link">
                    <input class="jd-edit-input" type="text" id="link" name="link" value="${ad.link}">
                </label>
                <h4 class="jd-edit-h">Description</h4>
                <label class="jd-edit-input-box" for="description">
                    <input class="jd-edit-input" type="text" id="description" name="description"
                           value="${ad.description}">
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

