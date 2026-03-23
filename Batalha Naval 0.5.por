programa{
	inclua biblioteca Util --> u
	
	cadeia oceano[4][4]
	cadeia gabarito[4][4]
	inteiro opcao = 0
	inteiro l, c
	
	funcao inicio(){
		enquanto(opcao != 3) {
			escreva("|----------BATALHA NAVAL----------|\n")
			escreva("| Escolha uma opção               |\n")
			escreva("| 1 - Jogar                       |\n")
			escreva("| 2 - Regras                      |\n")
			escreva("| 3 - Sair                        |\n")
			escreva("|---------------------------------|\n")
			escreva("| ")
			leia(opcao)
			limpa()

			escolha(opcao) {
				caso 1:
					jogar()
					pare
				caso 2:
					exibir_regras()
					pare
				caso 3:
					escreva("|---------------------------------|\n")
					escreva("| Finalizando o jogo...           |\n")
					escreva("|---------------------------------|\n")
					pare
				caso contrario:
					escreva("| Opção inválida! Tente novamente |\n")
			}
		}
	}

	funcao vazio exibir_regras() {
		escreva("|-------------REGRAS--------------|\n")
		escreva("| Você tem que acertar os navios! |\n")
		escreva("| Para isso escolha um número     |\n")
		escreva("| 0 a 3, selecionando a linha e   |\n")
		escreva("| coluna que deseja acertar       |\n")
		escreva("|--------------MAPA---------------|\n")
		escreva("| [~] Oceano desconhecido         |\n")
		escreva("| [*] Fogo (Atingiu o navio)      |\n")
		escreva("| [A] Água (Atingiu a água)       |\n")
		escreva("|---------------------------------|\n")
		escreva("|            Boa Sorte            |\n")
		escreva("|---------------------------------|\n")
		u.aguarde(5000)
		limpa()
	}

	funcao vazio preencher_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				oceano[l][c] = "~"
			}
		}
	}

	 
	funcao vazio exibir_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				escreva(oceano[l][c], " ")
			}
			escreva("\n")
		}
	}
	
	funcao vazio jogar() {
		
		inteiro municao = 5
		inteiro navios_restantes = 3
		inteiro linha_tiro, coluna_tiro

		preencher_mar()
		gerar_navios_gabarito()

		enquanto(municao > 0 e navios_restantes > 0) {
			exibir_mar()
			escreva("\n")
			escreva("|---------------------------------|\n")
			escreva("| Munição restante: ", municao, "             |\n")
			escreva("| Navios restantes: ", navios_restantes, "             |\n")
			escreva("|---------------------------------|\n")
			escreva("| Digite a Linha (0-3):           |\n")
			escreva("| ")
			leia(linha_tiro)
			escreva("|---------------------------------|\n")
			escreva("| Digite a Coluna (0-3):          |\n")
			escreva("| ")
			leia(coluna_tiro)

			se(linha_tiro < 0 ou linha_tiro > 3 ou coluna_tiro < 0 ou coluna_tiro > 3) {
				escreva("|---------------------------------|\n")
				escreva("| Coordenada Inválida!            |\n")
				escreva("| Você perdeu uma munição!        |\n")
				escreva("|---------------------------------|\n")
			}senao{			
				se(gabarito[linha_tiro][coluna_tiro] == "N") {
					escreva("|---------------------------------|\n")
					escreva("| FOGO! [*] Você atingiu um navio |\n")
					escreva("|---------------------------------|\n")
					oceano[linha_tiro][coluna_tiro] = "*"
					gabarito[linha_tiro][coluna_tiro] = "X"
					navios_restantes--
				}senao{
					escreva("|---------------------------------|\n")
					escreva("| ÁGUA... [A] Não havia nada lá   |\n")
					escreva("|---------------------------------|\n")
					oceano[linha_tiro][coluna_tiro] = "A"
				}
			}
			municao--
			u.aguarde(2000)
			limpa()
		}
		escreva("|---------RESULTADO FINAL---------|\n")
		exibir_mar()
		se(navios_restantes == 0) {
			escreva("|---------------------------------|\n")
			escreva("| PARABÉNS!!! Frota destruída!    |\n")
			escreva("|---------------------------------|\n")
		}senao{
			escreva("|---------------------------------|\n")
			escreva("| Fim de Jogo! Sua munição acabou |\n")
			escreva("|---------------------------------|\n")
			u.aguarde(2000)
		}
	}

	funcao vazio gerar_navios_gabarito() {
		inteiro n = 0

		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				gabarito[l][c] = "~"
			}
		}

		enquanto(n < 3) {
			l = u.sorteia(0, 3)
			c = u.sorteia(0, 3)

			se(gabarito[l][c] == "~") {
				gabarito[l][c] = "N"
				n++
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3653; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */