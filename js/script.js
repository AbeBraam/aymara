document.getElementById('loginForm').addEventListener('submit', function(event) {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    if (username.trim() === "" || password.trim() === "") {
        event.preventDefault();
        alert("Por favor, complete todos los campos.");
    }
});
