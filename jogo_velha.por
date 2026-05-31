programa {
  inclua biblioteca Graficos --> g
  inclua biblioteca Util --> u
  inclua biblioteca Tipos --> t

  funcao desenhar_tabuleiro() {
    g.iniciar_modo_grafico(verdadeiro)
    g.definir_dimensoes_janela(500, 500)

    inteiro progresso = 0
    g.definir_cor(g.COR_PRETO)
    g.limpar()
      
    enquanto(progresso <= 100) {
      g.definir_cor(g.COR_BRANCO)

      g.desenhar_linha(100, 175, (100 + progresso * 3), 175) // horizontais
      g.desenhar_linha((400 - progresso * 3), 250, 400, 250)  

      g.desenhar_linha(200, 100, 200, (100 + progresso * 2.3))  // verticais
      g.desenhar_linha(300, (330 - progresso * 2.3), 300, 330) 
      g.renderizar()
      progresso++
    }

    g.definir_tamanho_texto(33)
    para(inteiro i = 0; i < 3; i++){
      g.desenhar_texto(130 + (110 * i), 70, t.inteiro_para_cadeia(i, 10)) // cima
      g.desenhar_texto(40, 150 + (80 * i), t.inteiro_para_cadeia(i, 10)) // lateral
      g.renderizar()
      u.aguarde(500)

    }

  }

  funcao logico e_valido(inteiro resposta) {
    se(resposta < 0 ou resposta > 2) {
      retorne falso

    } senao {
      retorne verdadeiro

    }
  }

  funcao logico verificar_vitoria(caracter tabul[][], logico desenhar) {
    inteiro progresso = 0

    para(inteiro i = 0; i < 3; i++) {
      // verifica linha i
      se(tabul[i][0] != ' ' e tabul[i][0] == tabul[i][1] e tabul[i][1] == tabul[i][2]) {
        
        se(desenhar){
          g.definir_cor(g.COR_VERDE)
          enquanto(progresso <= 100) {
            g.desenhar_linha(120, 135 + (80 * i), (120 + progresso * 2.6), 135 + (80 * i))
            g.renderizar()
            progresso++
          }
        }

        retorne verdadeiro
      }
      
      // verifica coluna i
      se(tabul[0][i] != ' ' e tabul[0][i] == tabul[1][i] e tabul[1][i] == tabul[2][i]) {
         
        se(desenhar){
          g.definir_cor(g.COR_VERDE)
          enquanto(progresso <= 100) {
            g.desenhar_linha(140 + (110 * i), 120, 140 + (110 * i), (120 + progresso * 2))
            g.renderizar()
            progresso++
          }
        }
        retorne verdadeiro
      }
    }

        // diagonal principal (↘)
    se(tabul[0][0] != ' ' e tabul[0][0] == tabul[1][1] e tabul[1][1] == tabul[2][2]) {
       
        se(desenhar){
          g.definir_cor(g.COR_VERDE)
          enquanto(progresso <= 100) {
            g.desenhar_linha(120, 120, (120 + progresso * 2.5), (120 + progresso * 2))
            g.renderizar()
            progresso++
          }
        }
        retorne verdadeiro
    }

    // diagonal secundária (↙)
    se(tabul[0][2] != ' ' e tabul[0][2] == tabul[1][1] e tabul[1][1] == tabul[2][0]) {
        
        se(desenhar){
          g.definir_cor(g.COR_VERDE)
          enquanto(progresso <= 100) {
            g.desenhar_linha(370, 120, (370 - progresso * 2.5), (120 + progresso * 2))
            g.renderizar()
            progresso++
          }
        }
        retorne verdadeiro
    }
    retorne falso
  }

  funcao logico calcular_jogada(caracter tabul[][], caracter testar, inteiro &lin, inteiro &colu) {
    caracter copia[3][3]
    para(inteiro i = 0; i <= 2; i++) { // Cria uma cópia da matriz p/ evitar mutação na original
      para(inteiro j = 0; j <= 2; j++) {
        copia[i][j] = tabul[i][j]
      }
    }
    
    para(inteiro i = 0; i <= 2; i++) {
      para(inteiro j = 0; j <= 2; j++) {
        se(copia[i][j] == ' ') {
          copia[i][j] = testar
          se(verificar_vitoria(copia, falso)) {
            lin = i
            colu = j
            retorne verdadeiro
          }
          copia[i][j] = ' '
        }
      }
    }
    retorne falso
  }

  funcao jogar_pve(cadeia jogadores[], inteiro &vit_j1, inteiro &vit_j2, inteiro &emp) {
    caracter tabuleiro[3][3]
    inteiro distancia_horizontal[3] = {130, 240, 350}
    inteiro distancia_vertical[3] = {150, 230, 310}
    inteiro jogador_atual = 0
    inteiro row = 0, col = 0

    para(row = 0; row < 3; row++) { // Inicializa a matriz com ' ' em todas as posições
      para(col = 0; col < 3; col++) {
        tabuleiro[row][col] = ' '
      }
    }

    desenhar_tabuleiro()

    para(inteiro turno = 1; turno <= 9; turno++) { // O máximo de turnos é 9 já q existem apenas 9 posições no jogo da velha
      escreva("Turno ", turno, "\n")

      logico entrada_valida = falso

      se(turno % 2 != 0) { // Jogador sempre começa
        enquanto(nao(entrada_valida)) {
          escreva("Digite a linha: ")
          leia(row)
          escreva("Digite a coluna: ")
          leia(col)

          se(e_valido(row) e e_valido(col) e tabuleiro[row][col] == ' ') {
            entrada_valida = verdadeiro
          } senao {
            escreva("Coordenadas inválidas. Tente novamente.\n")
          }
        }

        tabuleiro[row][col] = 'X'
        g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "X") // lateral
        g.renderizar()
        jogador_atual = 0
        u.aguarde(300)

      } senao {
        se(turno == 2) {
          faca{
            row = u.sorteia(0, 2)
            col = u.sorteia(0, 2)

          } enquanto(tabuleiro[row][col] == 'X')

        } senao {
          inteiro linha, coluna
          se(calcular_jogada(tabuleiro, 'O', linha, coluna)) {
            row = linha
            col = coluna
          } senao se(calcular_jogada(tabuleiro, 'X', linha, coluna)) {
            row = linha
            col = coluna

          } senao {
            row = u.sorteia(0, 2)
            col = u.sorteia(0, 2)
          }
        }

        tabuleiro[row][col] = 'O'
        g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "O") // lateral
        g.renderizar()
        jogador_atual = 1
      }

      
      se(turno >= 5 e verificar_vitoria(tabuleiro, verdadeiro)) { // Qtd mínima de jogas necessárias p/ se ganhar
        escreva("O jogador ", jogadores[jogador_atual], " venceu! PARABÉNS!!!\n")
        se(jogador_atual == 0) {
          vit_j1 += 1
        } senao se(jogador_atual == 1) {
          vit_j2 += 1
        }
        pare

      } senao se(turno == 9) {
        g.definir_cor(g.COR_VERMELHO)
        g.definir_tamanho_texto(50)
        para(row = 0; row < 3; row++) {
          para(col = 0; col < 3; col++) {
            g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "V") // lateral
            g.renderizar()
            u.aguarde(100)

          }
        }
        escreva("Deu velha!\n")
        emp += 1
      }


    }
    // u.aguarde(500)
    // g.encerrar_modo_grafico() por algum motivo tbm encerra o programa - o msm vale pra func fechar_janela()


  }

  funcao jogar_pvp(cadeia jogadores[], inteiro &vit_j1, inteiro &vit_j2, inteiro &emp) {
    caracter tabuleiro[3][3]
    inteiro distancia_horizontal[3] = {130, 240, 350}
    inteiro distancia_vertical[3] = {150, 230, 310}
    inteiro jogador_atual = 0
    inteiro row = 0, col = 0

    para(row = 0; row < 3; row++) {
      para(col = 0; col < 3; col++) {
        tabuleiro[row][col] = ' '
      }
    }

    

    desenhar_tabuleiro()

    para(inteiro turno = 1; turno <= 9; turno++) {
      escreva("Turno ", turno, "\n")

      logico entrada_valida = falso
      enquanto(nao(entrada_valida)) {
        escreva("Digite a linha: ")
        leia(row)
        escreva("Digite a coluna: ")
        leia(col)

        se(e_valido(row) e e_valido(col) e tabuleiro[row][col] == ' ') {
          entrada_valida = verdadeiro
        } senao {
          escreva("Coordenadas inválidas. Tente novamente.\n")
        }
      }

      se(turno % 2 != 0) {
        tabuleiro[row][col] = 'X'
        g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "X") // lateral
        g.renderizar()
        jogador_atual = 0

      } senao {
        tabuleiro[row][col] = 'O'
        g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "O") // lateral
        g.renderizar()
        jogador_atual = 1
      }

      se(turno >= 5 e verificar_vitoria(tabuleiro, verdadeiro)) {
        escreva("O jogador ", jogadores[jogador_atual], " venceu! PARABÉNS!!!\n")
        se(jogador_atual == 0) {
          vit_j1 += 1
        } senao se(jogador_atual == 1) {
          vit_j2 += 1
        }
        pare

      } senao se(turno == 9) {
        g.definir_cor(g.COR_VERMELHO)
        g.definir_tamanho_texto(50)
        para(row = 0; row < 3; row++) {
          para(col = 0; col < 3; col++) {
            g.desenhar_texto(distancia_horizontal[col], distancia_vertical[row], "V")
            g.renderizar()
            u.aguarde(100)

          }
        }
        escreva("Deu velha!\n")
        emp += 1
      }

    }

  }

  funcao inicio() {
    cadeia jogadores[2]
    inteiro vitorias_j1 = 0
    inteiro vitorias_j2 = 0
    inteiro empates = 0
    logico rodar = verdadeiro
    cadeia aba_menu = "INÍCIO"
    inteiro opcao = 0


    escreva("╔════════════════════════════════╗\n")
    escreva("║   BEM-VINDO(A) AO VELHAS-3000  ║\n")
    escreva("╠════════════════════════════════╣\n")
    escreva("║      X  O  X  O  X  O  X       ║\n")
    escreva("╚════════════════════════════════╝\n")

    enquanto(rodar) {
      escolha(aba_menu) {
        caso "INÍCIO":
          escreva("Escolha quantos jogadores:\n")
          escreva("1 Jogador\t\t2 Jogadores\n")
          escreva("> ")
          leia(opcao)
          se(opcao == 1) {
            escreva("Você escolheu 1 jogador.\n")
            escreva("Digite o nome do jogdador: ")
            leia(jogadores[0])
            jogadores[1] = "EX-MACHINA"
            aba_menu = "1J"

          } senao se (opcao == 2) {
            escreva("Você escolheu 2 jogadores.\n")
            escreva("Qual o nome do jogdador 1: ")
            leia(jogadores[0])
            escreva("Qual o nome do jogdador 2: ")
            leia(jogadores[1])
            aba_menu = "2J"

          } senao {
            escreva("Opção inválida. Tente Novamente.\n")

          }
          pare

        caso "1J":
          opcao = 0
          faca {
            jogar_pve(jogadores, vitorias_j1, vitorias_j2, empates)

            escreva("Vitórias do jogador ", jogadores[0], ": ", vitorias_j1, "\n")
            escreva("Vitórias do jogador ", jogadores[1], ": ", vitorias_j2, "\n")
            escreva("Empates: ", empates, "\n\n")
            escreva("Escolha uma oção:\n")
            escreva("1. Jogar novamente\n")
            escreva("2. Escolher outro modo\n")
            escreva("> ")
            leia(opcao)

            se(opcao == 2) {
              aba_menu = "INÍCIO"
            }

          } enquanto(opcao < 1 ou opcao > 2)
          pare

        caso "2J":
         opcao = 0
          faca {
            jogar_pvp(jogadores, vitorias_j1, vitorias_j2, empates)

            escreva("Vitórias do jogador ", jogadores[0], ": ", vitorias_j1, "\n")
            escreva("Vitórias do jogador ", jogadores[1], ": ", vitorias_j2, "\n")
            escreva("Empates: ", empates, "\n\n")
            escreva("Escolha uma oção:\n")
            escreva("1. Jogar novamente\n")
            escreva("2. Escolher outro modo\n")
            escreva("> ")
            leia(opcao)

            se(opcao == 2) {
              aba_menu = "INÍCIO"
            }

          } enquanto(opcao < 1 ou opcao > 2)
          pare

      }

    }

    
  }
}
