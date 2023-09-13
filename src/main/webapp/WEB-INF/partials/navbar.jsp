
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar container">
<c:if test="${not empty sessionScope.user}">
<img onclick="window.location.href='/profile'" class="user-icon" src="/img/icons8-user-64%20(1).png">
</c:if>
    <div class="brand-container">
        <div class="byte-club">
            <button onclick="window.location.href='/ads'" class="comic-button">THE BYTE CLUB</button>
        </div>
    </div>
    <form class="search-bar" action="${pageContext.request.contextPath}/search" method="post">
            <input class="form-control comic-button" type="text" name="search" placeholder="Search" aria-label="Search">
    </form>
    <div class="nav-btns">
        <c:if test="${not empty sessionScope.user}">
            <button onclick="window.location.href='/logout'" class="logout comic-button">LOGOUT</button>
            <button onclick="window.location.href='/ads/create'" class="login comic-button">CREATE</button>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <button onclick="window.location.href='/login'" class="login comic-button">LOGIN</button>
            <button onclick="window.location.href='/register'" class="logout comic-button">SIGNUP</button>
        </c:if>
    </div>
</div>

