<div class="navbar container">
    <div class="brand-container">
        <div class="byte-club">
            <button onclick="window.location.href='/ads'">THE BYTE CLUB</button>
        </div>
    </div>
    <form class="search-bar" action="${pageContext.request.contextPath}/search" method="post">
            <input class="form-control mr-sm-2" type="text" name="search" placeholder="Search" aria-label="Search">
            <button class="search-btn login" type="submit">Search</button>
    </form>
    <div class="nav-btns">
        <button onclick="window.location.href='/login'" class="login">LOGIN</button>
        <button onclick="window.location.href='/logout'" class=" logout ">LOGOUT</button>
        <button onclick="window.location.href='/register'" class=" logout ">SIGNUP</button>
    </div>
</div>

