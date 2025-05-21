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

// Função usada em páginas onde o usuário deve estar logado para acessar
function validarUsuarioLogado() {
    if(sessionStorage.ID_USUARIO == undefined){
        // Fechar automático ou esperar usuário clicar no botão?
        Swal.fire({
        title: 'Acesso negado!',
        html: 'Você deve entrar na sua conta para acessar essa tela!',
        icon: 'error',
        showCancelButton: true,
        showConfirmButton: true,
        confirmButtonColor: '#155d9c',
        backdrop: 'rgba(0, 0, 0, 0.9)', // Fundo preto quando modal está aberto
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Ir para login'
      })
      .then(resultado => {
        if(resultado.dismiss == Swal.DismissReason.cancel){
            history.back()
        }
        else {
            window.location = 'login.html'
        }
      });
    }
}