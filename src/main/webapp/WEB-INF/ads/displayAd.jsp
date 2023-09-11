<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <title>Display</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<h1>Display Ad</h1>
<div>
    <h1>${ad.title}</h1>
    <h2><a href="${ad.link}" target="_blank">${ad.link}</a></h2>
    <%-- <img src="${ad.imageSource}">--%>
    <p>${ad.description}</p>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp" />
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
