programa {
  inclua biblioteca Util --> use


  funcao consultar_saldo(inteiro sld) {

    escreva("\n")
    escreva("╔══════════════════════════════════════╗\n")
    escreva("       Seu saldo é de R$", sld, ",00\n")
    escreva("╚══════════════════════════════════════╝\n")

  }

  funcao pegar_emprestimo(logico &ja, inteiro &sld) {
    inteiro valor_empre = 0

    escreva("> Consultando disponibilidade")
    escreva(".")
    use.aguarde(500)
    escreva(".")
    use.aguarde(500)
    escreva(".\n")
    use.aguarde(500)
    escreva("\n")

    se(nao(ja)) {
      escreva("> Qual valor do empréstimo: ")
      leia(valor_empre)

      se(valor_empre > 10000 ou valor_empre <= 0) {
        escreva("> Valor de empréstimo indisponível.\n")

      } senao {
        sld += valor_empre
        ja = verdadeiro

        escreva("[✓] Empréstimo realizado com sucesso!\n\n")

      }


    } senao {
      escreva("> Quite empréstimo anterior p/ dar continuidade.\n")
    
    }

    

    
  }

  funcao consultar_extrato(inteiro sld_ini, inteiro sld, logico ja) {
    se(ja) {
      escreva("\nSaldo Inicial: R$", sld_ini, ",00\n")
      escreva("Empréstimo Realizado: +R$", sld - sld_ini, ",00\n")
      escreva("Saldo Final: R$", sld, ",00\n\n")
    } senao {
      escreva("\nSaldo: R$", sld_ini, ",00\n\n")

    }
  }

  funcao inicio() {
    cadeia usuario = ""
    inteiro opcao = 0
    inteiro saldo_inicial = use.sorteia(0, 9999)
    inteiro saldo = saldo_inicial
    logico ja_pegou = falso

    escreva("╔══════════════════════════════════════╗\n")
    escreva("║           BANCO BANK TERMINAL        ║\n")
    escreva("╚══════════════════════════════════════╝\n")
    
    escreva("[✓] Conexão segura estabelecida\n")
    escreva("[✓] Criptografia bancária ativa\n")
    escreva("> Bem-vindo(a)! P/ começar, fornceça o nome de usuário:\n")
    
    escreva("> Usuário: ")
    leia(usuario)

    escreva("> Carregando dados")
    escreva(".")
    use.aguarde(500)
    escreva(".")
    use.aguarde(500)
    escreva(".\n")
    use.aguarde(500)
    escreva("\n")

    escreva("[✓] Autenticação concluída com sucesso!\n")
    
  
    logico rodar_menu = verdadeiro
    enquanto(rodar_menu) {
      escreva("> Selecione uma opção:\n")
      escreva("  1. Consultar Saldo\n")
      escreva("  2. Ver Extrato\n")
      escreva("  3. Realizar Empréstimo\n")
      escreva("  4. Sair\n")
      escreva("> Digite sua escolha: ")
      leia(opcao)

      escolha(opcao) {
        caso 1:
          consultar_saldo(saldo)
          pare

        caso 2:
          consultar_extrato(saldo_inicial, saldo, ja_pegou)
          pare

        caso 3:
          pegar_emprestimo(ja_pegou, saldo)
          pare

        caso 4:
          escreva("> Obrigado por utilizar o Banco Bank!")
          rodar_menu = falso
          pare
        
        caso contrario:
          escreva("Opção Inválida. Tente Novamente.\n")

      }
    }
  
  }
}
