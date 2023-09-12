<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar container">
<c:if test="${not empty sessionScope.user}">
<img onclick="window.location.href='/profile'" class="user-icon" src="/img/icons8-user-64%20(1).png">
</c:if>
    <div class="brand-container">
        <div class="byte-club">
            <button onclick="window.location.href='/ads'">THE BYTE CLUB</button>
        </div>
    </div>
    <div class="search-bar">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="search-btn login" type="submit">Search</button>
    </div>
    <div class="nav-btns">
        <c:if test="${not empty sessionScope.user}">
            <button onclick="window.location.href='/logout'" class="logout ">LOGOUT</button>
            <button onclick="window.location.href='/ads/create'" class="login">CREATE</button>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <button onclick="window.location.href='/login'" class="login">LOGIN</button>
            <button onclick="window.location.href='/register'" class="logout ">SIGNUP</button>
        </c:if>
    </div>
</div>

