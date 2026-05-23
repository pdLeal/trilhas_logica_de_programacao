programa {
  funcao inicio() {
    cadeia nome
    real saldo_inicial
    real preco_setup
    real novo_saldo
    cadeia aba_menu
    logico rodar_menu
    inteiro resposta

    escreva("Digite o nome do usuário: ")
    leia(nome)

    escreva("Digite o seu saldo atual: ")
    leia(saldo_inicial)

    escreva("Quanto deseja gastar no novo setup?\n")
    leia(preco_setup)

    novo_saldo = saldo_inicial - preco_setup

    se(novo_saldo < 0) {
      escreva( nome + ", compra negada! Saldo insuficiente. Faltam R$ " + novo_saldo * -1 + " para completar.\n")
    
    } senao {
      escreva("Compra aprovada! Seu novo saldo é R$ " + novo_saldo + "\n")

      se(novo_saldo >= 1000) {
        escreva("Status: Rico! 🤑\n")

      } senao se(novo_saldo > 1 e novo_saldo < 1000 ) {
        escreva("Status: Tá pago! Mas economize. 💸\n")

      } senao {
        escreva("Status: No limite! ⚠️\n")

      }

    }

    aba_menu = "INÍCIO"
    rodar_menu = verdadeiro
    faca {
      escolha(aba_menu) {
        caso "INÍCIO":
          escreva("Escolha uma opção (1, 2 ou 3):\n")
          escreva("1. Ver extrato completo.\n")
          escreva("2. Realizar nova compra.\n")
          escreva("3. Sair\n")
          leia(resposta)

          se(resposta == 1) {
            aba_menu = "EXTRATO"
          
          } senao se(resposta == 2) {
            aba_menu = "COMPRA"

          } senao se(resposta == 3) {
            escreva("Obrigado e volte sempre!\n")
            rodar_menu = falso

          } senao {
            escreva("Opção inválida! Tente novamente. \n")
            aba_menu = "INÍCIO"

          }
          pare

        caso "EXTRATO":
          escreva("\nSaldo Inicial: R$ " + saldo_inicial + "\n")

          se(novo_saldo < 0) {
            escreva("Tentativa de compra negada no valor de: R$ " + preco_setup + "\n")
            escreva("Saldo Atual: R$ " + saldo_inicial + "\n\n")

          } senao {
            escreva("Compra no valor de: R$ " + preco_setup + "\n")
            escreva("Saldo Atual: R$ " + novo_saldo + "\n\n")

          }


          aba_menu = "INÍCIO"
          pare

        caso "COMPRA":
          escreva("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️" + "\n")
          escreva("CHEGA DE CONSUMISMO! VAI GASTAR MAIS NÃO!!!" + "\n")
          escreva("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️" + "\n")

          rodar_menu = falso

      }

    } enquanto(rodar_menu)

  }
}
