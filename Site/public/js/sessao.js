function validarSessao() {
    var nome = sessionStorage.NOME_USUARIO
    var email = sessionStorage.EMAIL_USUARIO

    var usuarioLogadoNav = document.getElementById("usuarioLogadoNav")
    var botoesAutenticao = document.getElementById("botoesAutenticaoNav")

    if (email != null && nome != null) {
        usuarioLogadoNav.innerHTML = `Olá, ${nome}! <button onclick="limparSessao()"> <img src="/assets/deslogar.svg"></button>`
        botoesAutenticao.style.display = 'none'
    }
    else {
        usuarioLogadoNav.style.display = 'none'
    }
}

function limparSessao() {
    sessionStorage.clear()
    window.location = "../index.html"
}