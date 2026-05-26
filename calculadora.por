programa {
  funcao real add(real n1, real n2) {
    retorne n1 + n2
  }

  funcao real sub(real n1, real n2) {
    retorne n1 - n2
  }

  funcao real mul(real n1, real n2) {
    retorne n1 * n2
  }

  funcao real div(real n1, real n2) {
    retorne n1 / n2
  }
  
  
  funcao inicio() {
    logico rodar_menu = verdadeiro
    cadeia aba_menu = "INÍCIO"
    inteiro opcao = 0
    real num1 = 0
    real num2 = 0
    real result = 0

    escreva("Bem-vindo(a) à Calculadora Terminus!\n")
    enquanto(rodar_menu) {
      escolha(aba_menu) {
        caso "INÍCIO":
          escreva("Escolha uma das operações:\n")
          escreva("1. Adição\n")
          escreva("2. Subtração\n")
          escreva("3. Multiplicação\n")
          escreva("4. Divisão\n")
          escreva("5. Sair\n")
          escreva("---> ")
          leia(opcao)

          se(opcao <= 0 ou opcao > 5) {
            escreva("Opção Inválida! Tente novamente.\n")
          
          } senao se(opcao == 1) {
            aba_menu = "ADD"
          
          } senao se(opcao == 2) {
            aba_menu = "SUB"
          
          } senao se(opcao == 3) {
            aba_menu = "MUL"
          
          } senao se(opcao == 4) {
            aba_menu = "DIV"
          
          } senao se(opcao == 5) {
            escreva("Obrigado por usar nossos serviços e volte sempre!\n")
            rodar_menu = falso

          }
          pare
        caso "ADD":
          escreva("Digite o primeiro número: ")
          leia(num1)
          escreva("Digite o segundo número: ")
          leia(num2)
          result = add(num1, num2)

          escreva("A soma dos números ", num1, " e ", num2, " é igual a: ", result, "\n")
          aba_menu = "INÍCIO"
          pare
          
        caso "SUB":
          escreva("Digite o minuendo: ")
          leia(num1)
          escreva("Digite o subtraendo: ")
          leia(num2)
          result = sub(num1, num2)

          escreva("A diferença entre os números ", num1, " e ", num2, " é igual a: ", result, "\n")
          aba_menu = "INÍCIO"
          pare
          
        caso "MUL":
          escreva("Digite o multiplicando: ")
          leia(num1)
          escreva("Digite o multiplicador: ")
          leia(num2)
          result = mul(num1, num2)

          escreva("O produto entre os números ", num1, " e ", num2, " é igual a: ", result, "\n")
          aba_menu = "INÍCIO"
          pare
          
        caso "DIV":
          escreva("Digite o dividendo: ")
          leia(num1)
          escreva("Digite o divisor: ")
          leia(num2)
          se(num2 == 0) {
            escreva("Impossível dividir por 0. Comece novamente.\n")
          } senao {
            result = div(num1, num2)

            escreva("O quociente entre os números ", num1, " e ", num2, " é igual a: ", result, "\n")
            aba_menu = "INÍCIO"

          }
          pare

      }   

    }
   
  }
}
