/*
NOME: Pedro Henrique Leal Rodrigues Lopes
DISCIPLINA: Lógica de Programação
TURMA: DS-14
*/

programa {
  inclua biblioteca Texto --> txt
  inclua biblioteca Matematica --> math
  inclua biblioteca Util --> use

  funcao atividade_1() {
    cadeia palavra = ""
    cadeia ao_contrario = ""
    inteiro num_char = 0
    caracter central_char = ' '
    caracter last_char = ' '
    real index_central_char = 0.0


    escreva("Digite uma palavra: ")
    leia(palavra)

    escreva("A palavra digitada foi: ", palavra, "\n")
    
    num_char = txt.numero_caracteres(palavra)
    escreva("A palavra digitada possui ", num_char, " caracteres.\n")
 
    escreva("A primeira letra é ", txt.obter_caracter(palavra, 0), "\n")
 
    index_central_char = math.valor_absoluto(num_char / 2)
    central_char = txt.obter_caracter(palavra, index_central_char)
    escreva("A letra central da palavra é: ", central_char, "\n")

    last_char = txt.obter_caracter(palavra, num_char - 1)
    escreva("A última letra é ", last_char, "\n")

    para(inteiro i = num_char - 1; i >= 0 ; i--){
      ao_contrario += txt.obter_caracter(palavra, i)
    }
    escreva("A palavra escrita ao contrário é: ", ao_contrario, "\n")
    escreva("A palavra toda em maiusculo: ", txt.caixa_alta(palavra), "\n")
    escreva("A palavra toda em minusculo: ", txt.caixa_baixa(palavra), "\n")
  }

  funcao atividade_2() {
    inteiro num = 0
    logico primo = verdadeiro

    escreva("Digite um número inteiro: ")
    leia(num)

    se(num % 2 == 0) {
      escreva("O número ", num, " é par!\n")
      
    } senao {
      escreva("O número ", num, " é impar!\n")

    }

    se(num >= 0) {
      escreva("O número ", num, " é positivo!\n")
      
    } senao {
      escreva("O número ", num, " é negativo!\n")

    }

    se (num < 2) {
      primo = falso
    } senao {
      para (inteiro i = 2; i < num; i++) {
        se (num % i == 0) {
          primo = falso
        }
      }
    }

    se(primo) {
      escreva("O número ", num, " é primo!\n")

    } senao {
      escreva("O número ", num, " não é primo!\n")

    }

    se(num < 0){
      escreva("Impossível calcular raiz de número negavito. Use sua imaginação =)\n")
    
    } senao {
      escreva("A raiz quadrada do número ", num, " é: ", math.raiz(num, 2), "\n")
      
    }

      escreva("O número ", num, " elevado a 3 é: ", math.potencia(num, 3), "\n")

  }

  funcao atividade_3() {
    real valor_compra = 0
    real desconto = 0

    escreva("Qual o valor da compra?\n") 
    leia(valor_compra) 

    faca {
      escreva("Qual o valor do cupom de desconto?\n")
      leia(desconto)
      
      se(desconto > 30) {
        escreva("Nananina não. É desconto, não de graça U.u\n")
      }

    } enquanto(desconto > 30)
  
    real porcent = desconto / 100
    real valor_final = math.arredondar(valor_compra - (valor_compra * porcent), 2)
    
    escreva("Valor total da compra: R$ ", valor_compra, "\n")
    escreva("Valor do cupom: ", desconto, "%\n")
    escreva("Valor final da compra: R$ ", valor_final, "\n")
  }

  funcao achar_maior_nota(inteiro nts[]) {
    inteiro maior = 0
    para(inteiro i = 0; i < use.numero_elementos(nts); i++) {
      se(nts[i] > maior) {
        maior = nts[i]
      }
    }
    escreva("\nA maior nota foi: ", maior, "\n")
    
  }

  funcao achar_menor_nota(inteiro nts[]) {
    inteiro menor = 11
    para(inteiro i = 0; i < use.numero_elementos(nts); i++) {
      se(nts[i] < menor) {
        menor = nts[i]
      }
    }
    escreva("A menor nota foi: ", menor, "\n")
    
  }

  funcao atividade_4() {
    inteiro nota = 0
    inteiro notas[5]
    inteiro total = 0
    real media = 0

    para(inteiro i = 0; i < 5; i++) {
      
      nota = use.sorteia(0, 10)
      notas[i] = nota
      total += nota
      escreva("Aluno ", i + 1, ": Nota ", nota, "\n")
    }

    achar_maior_nota(notas)
    achar_menor_nota(notas)

    media = total / use.numero_elementos(notas)
    escreva("A media da tumra foi: ", media, "\n")

  }

  funcao atividade_5() {
    inteiro nota = use.sorteia(0, 100)
    escreva("Sua nota foi: ", nota, "\n")
    se(nota > 90) {
      escreva("Conceito A\n")
    
    } senao se(nota > 80) {
      escreva("Conceito B\n")
      
    } senao se(nota > 70) {
      escreva("Conceito C\n")
      
    } senao se(nota > 60) {
      escreva("Conceito D\n")
      
    } senao {
      escreva("Conceito E\n")
    }

  }

  funcao inteiro menu_voltar() {
    inteiro opcao = 0
    enquanto(opcao <= 0 ou opcao > 2) {
      escreva("Escolha uma opção:\n")
      escreva("1) Voltar\n")
      escreva("2) Ver novamente\n")
      leia(opcao)
      se(opcao <= 0 ou opcao > 2) {
        escreva("Opção inválida. Tente novamente.\n")
      }

    }

    retorne opcao
  }

  funcao inicio() {
    cadeia menu = "INÍCIO"
    logico rodar_menu = verdadeiro
    inteiro atividade = 0
    
    faca {
      escolha(menu) {
        caso "INÍCIO":
          escreva("Escolha uma atividade:\n")
          para(inteiro i = 1; i <= 5; i++) {
            escreva(i, ") Atividade ", i, "\n")
          }
          escreva("6) Sair\n")

          escreva("Digite o número da atividade: ")
          leia(atividade)
          
          se(atividade <=0 ou atividade > 6) {
            escreva("Opção inválida. Tente novamente\n")

          } senao se(atividade == 6) {
            rodar_menu = falso

          } senao {
            menu = "ATIVIDADE_" + atividade

          }
          pare

        caso "ATIVIDADE_1": 
          atividade_1()
          se(menu_voltar() == 1) {
            menu = "INÍCIO"
          }
          pare

        caso "ATIVIDADE_2": 
          atividade_2()
          se(menu_voltar() == 1) {
            menu = "INÍCIO"
          }
          pare

        caso "ATIVIDADE_3": 
          atividade_3()
          se(menu_voltar() == 1) {
            menu = "INÍCIO"
          }
          pare

        caso "ATIVIDADE_4": 
          atividade_4()
          se(menu_voltar() == 1) {
            menu = "INÍCIO"
          }
          pare

        caso "ATIVIDADE_5": 
          atividade_5()
          se(menu_voltar() == 1) {
            menu = "INÍCIO"
          }
          pare
          
          






      }
      
    } enquanto(rodar_menu)


  }
}
