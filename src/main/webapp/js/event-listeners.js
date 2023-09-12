(function() {
    "use strict"
    //=========== Navbar listeners =========>
    const loginBtn = document.querySelector('.login')
    loginBtn.addEventListener('click', () => {
        window.location.href = "http://localhost:8080/login"
        console.log("wth")
    })

})();