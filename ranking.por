programa {
  inclua biblioteca Texto --> txt

  funcao inicio() {
    real pontos[5][2]
    cadeia nomes[5]
    inteiro linha = 0, coluna = 0
    real media = 0

    para(linha = 0; linha < 5; linha++){
      escreva("Digite o nome do competidor: ")
      leia(nomes[linha])

      enquanto(txt.numero_caracteres(nomes[linha]) < 3  ou txt.numero_caracteres(nomes[linha]) > 10) {
        escreva("Nome Inválido! Nome deve conter entre 3 e 10 caractéres. Tente novamente.\n")
        escreva(" ---> ")
        leia(nomes[linha])
      }

      escreva("Digite os pontos obtidos pelo jogador:\n")
      para(coluna = 0; coluna < 2; coluna++) {
        escreva("Rodada ", (coluna + 1), " ---> ")
        leia(pontos[linha][coluna])

        enquanto(pontos[linha][coluna] < 0 ou pontos[linha][coluna] > 100) {
          escreva("Nota Inválida! Tente novamente.\n")
          escreva("Rodada ", (coluna + 1), " ---> ")
          leia(pontos[linha][coluna])
        }
      }

      // media = (pontos[linha][0] + pontos[linha][1]) / 2
      // escreva("A media de pontos do jogador ", nomes[linha], " foi: ", media, "\n")

    }

    escreva("\n")
    para(linha = 0; linha < 5; linha++) {
      media = (pontos[linha][0] + pontos[linha][1]) / 2
      escreva("A média de pontos do jogador ", nomes[linha], " foi: ", media, "\n")
    }


  }
}
