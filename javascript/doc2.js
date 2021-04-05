function mascData(objeto, evento) {
    //Keycode 8: backspace. Keycode 46: delete.
    if (evento.keyCode == 8 || evento.keyCode == 46) {
      return true;
    }
  
    //Keycode entre 48 e 57: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9.
    if (evento.keyCode < 48 || evento.keyCode > 57) {
      alert("Somente números");
      return false;
    }
  
    //Limitar o tamanho da data de nascimento.
    if (objeto.value.length == 10) {
      return false;
    }
  
    if (objeto.value.length == 2 || objeto.value.length == 5) {
      objeto.value = objeto.value + "/";
    }
  
    return true;
  }
  
  function verificarFormulario() {
    var mensagem = "";
  
    if (nome.value == "") {
      mensagem += "Informe o nome.<br>";
    }
  
    if (email.value == "") {
      mensagem += "Informe o e-mail.<br>";
    }
  
    if (datanasc.value == "" || datanasc.value.length < 10) {
      mensagem += "Informe a data de nascimento.<br>";
    }
  
    if (escolaridade.value == "") {
      mensagem += "Informe a escolaridade.<br>";
    }
  
    var opcoesSexo = document.getElementsByName("sexo");
    var sexoPreenchido = false;
    for (var i = 0; i < opcoesSexo.length; i++) {
      if (opcoesSexo[i].checked == true) {
        sexoPreenchido = true;
        break;
      }
    }
    if (sexoPreenchido == false) {
      mensagem += "Informe o sexo.<br>";
    }
  
    if (mensagem == "") {
      alert("Funcionário cadastrado com sucesso!")
      return true;
    } else {
      resp.innerHTML = mensagem;
      return false;
    }
  }