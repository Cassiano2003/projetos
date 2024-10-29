let elementoResultado = document.querySelector(".js-resultado");
let elementoNumeros = document.querySelectorAll(".js-btn-padroes");
let elementoOperadores = document.querySelectorAll(".js-btn-padrao");
let elementoIgual = document.querySelector(".js-btn-igual");
let elementoLimparResultado = document.querySelector(".js-btn-ac");
let elementoTrocarSinal = document.querySelector(".js-btn-mais-menos");
let elementoDeletar = document.querySelector(".js-btn-del");

let resultado = "0";
let igual = 0;

function adicionaElementoAoInputResultado(simbolo) {
  // Verifica se o símbolo é o primeiro a ser inserido e não é um operador
  if (verificaSimboloInicial(simbolo) || (!igual && !/[+\-*/]/.test(simbolo))) {
    resultado = simbolo;
  } else {
    if (resultado.charAt(resultado.length-1) === ")" && !/[+\-*/]/.test(simbolo)) {
      resultado = resultado.slice(0, -1);
      resultado += simbolo + ")";
    }else{
      resultado += simbolo;
    }
  }
  igual = 1;
  elementoResultado.value = resultado;
}

function verificaSimboloInicial(simbolo) {
  return resultado === "0" && !/[+\-*/]/.test(simbolo);
}

function verificarSimboloDuplicado(simbolo) {
  const ultimoCaractere = resultado.slice(-1);
  if (/[+\-*/]/.test(ultimoCaractere) && /[+\-*/]/.test(simbolo)){
    resultado = resultado.slice(0, -1);
    resultado += simbolo;
    elementoResultado.value = resultado;
    return true;
  }
  return false;
}

function executarCalculo() {
  try {
    resultado = eval(resultado).toString(); // Avalia a expressão no visor
    elementoResultado.value = resultado;
    igual = 0;
  } catch (error) {
    alert("Erro na expressão.");
  }
}

function limparResultado() {
  resultado = "0";
  elementoResultado.value = "0";
}

function trocarSinalDaConta() {
  let aux = "";
  if (resultado !== "0") {
    for (let i = (resultado.length - 1); i >= 0; i--){ //Percorre o vetor a procura do primeiro operador
      if (i == 0){
        if (resultado.charAt(0) === "-") {
          resultado = resultado.slice(1); // Remove o sinal negativo
        } else {
          resultado = "-" + resultado; // Adiciona sinal negativo
        }
      }else if (/[+\-*/]/.test(resultado.charAt(i))){
        if (resultado.charAt(resultado.length-1) === ")") {
          aux = resultado.slice(i+1, -1);
          resultado = resultado.slice(0, i-1) + aux; // Remove o sinal negativo
        } else {
          resultado = resultado.slice(0, i+1) + "(-" + resultado.slice(i+1) + ")"; // Adiciona sinal negativo
        }
        break;
      }
    }
    elementoResultado.value = resultado;
  }
}

function deletarUltimaLetraDoResultado() {
  resultado = resultado.slice(0, -1); // Remove o último caractere
  elementoResultado.value = resultado;
}

function gerenciarEscutadores() {
  elementoNumeros.forEach(function (elemento) {
    elemento.addEventListener("click", function () {
      adicionaElementoAoInputResultado(elemento.textContent);
    });
  });

  elementoOperadores.forEach(function (elemento) {
    elemento.addEventListener("click", function () {
      const simbolo = elemento.textContent;
      if (!verificarSimboloDuplicado(simbolo)) {
        adicionaElementoAoInputResultado(simbolo);
      }
    });
  });

  elementoIgual.addEventListener("click", function () {
    executarCalculo();
  });

  elementoLimparResultado.addEventListener("click", function () {
    limparResultado();
  });

  elementoTrocarSinal.addEventListener("click", function () {
    trocarSinalDaConta();
  });

  elementoDeletar.addEventListener("click", function () {
    deletarUltimaLetraDoResultado();
  });
}

gerenciarEscutadores();