programa{
	inclua biblioteca Util --> u

	cadeia oceano[4][4], gabarito[4][4]
	inteiro opcao = 0, municao = 0, l, c
	real multiplicador = 1.0, pontos = 0.0, recorde = 0.0

	funcao inicio(){
		menu_inicial()
	}

	funcao vazio menu_inicial(){
		enquanto(opcao != 3) {
			escreva("|----------BATALHA NAVAL----------|\n")
			escreva("| Escolha uma opção               |\n")
			escreva("| 1 - Jogar                       |\n")
			escreva("| 2 - Regras                      |\n")
			escreva("| 3 - Sair                        |\n")
			escreva("|---------------------------------|\n")
			escreva("| Recorde: ", recorde, "\n")
			escreva("|---------------------------------|\n")
			escreva("| ")
			leia(opcao)
			limpa()

			escolha(opcao) {
				caso 1:
					menu_dificuldade()
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

	funcao vazio menu_dificuldade(){
		inteiro opcao_dificuldade

		enquanto(municao == 0){
			escreva("|---------------------------------|\n")
			escreva("| Escolha a dificuldade do jogo!  |\n")
			escreva("| 1 - Fácil (9 munições)          |\n")
			escreva("| 2 - Médio (6 munições)          |\n")
			escreva("| 3 - Difícil (4 munições)        |\n")
			escreva("|---------------------------------|\n")
			escreva("| ")
			leia(opcao_dificuldade)
	
			escolha(opcao_dificuldade){
				caso 1:
					municao = 9
					multiplicador = 1.0
					pare
				caso 2:
					municao = 6
					multiplicador = 2.5
					pare
				caso 3:
					municao = 4
					multiplicador = 5.0
					pare
				caso contrario:
					escreva("|---------------------------------|\n")
					escreva("| Opção inválida! Tente novamente |\n")
					escreva("|---------------------------------|\n")
					u.aguarde(2000)
					limpa()
					pare
			}
		}
		escreva("|---------------------------------|\n")
		escreva("| Carregando munição!!!           |\n")
		escreva("|---------------------------------|\n")
		u.aguarde(2000)
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

	funcao vazio jogar() {
		inteiro navios_restantes = 3, linha_tiro, coluna_tiro
		real bonus
		pontos = 0.0

		preencher_mar()
		gerar_navios_gabarito()

		enquanto(municao > 0 e navios_restantes > 0) {
			exibir_mar()
			escreva("\n")
			escreva("|---------------------------------|\n")
			escreva("| Seus pontos: ", pontos, "\n")
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
				escreva("| Escolha uma coluna e/ou linha   |\n")
				escreva("| entre 0 e 3                     |\n")
				escreva("|---------------------------------|\n")
			}senao se(oceano[linha_tiro][coluna_tiro] == "*" ou oceano[linha_tiro][coluna_tiro] == "A") {
				escreva("|---------------------------------|\n")
				escreva("| Você já atirou aí! Escolha      |\n")
				escreva("| um lugar vazio para atirar      |\n")
				escreva("|---------------------------------|\n")
			}senao{
				se(gabarito[linha_tiro][coluna_tiro] == "N"){
					escreva("|---------------------------------|\n")
					escreva("| FOGO! [*] Você atingiu um navio |\n")
					escreva("|---------------------------------|\n")
					oceano[linha_tiro][coluna_tiro] = "*"
					gabarito[linha_tiro][coluna_tiro] = "X"
					pontos = pontos + (100.0 * multiplicador)
					navios_restantes--
				}senao{
					escreva("|---------------------------------|\n")
					escreva("| ÁGUA... [A] Não havia nada lá   |\n")
					escreva("|---------------------------------|\n")
					oceano[linha_tiro][coluna_tiro] = "A"
				}
				municao--
			}
			u.aguarde(2000)
			limpa()
		}

		bonus = (municao * 50.0) * multiplicador
		pontos = bonus + pontos

		escreva("|---------RESULTADO FINAL---------|\n")
		exibir_mar()
		se(navios_restantes == 0) {
			escreva("|---------------------------------|\n")
			escreva("| PARABÉNS!!! Frota destruída!    |\n")
			escreva("| Sua pontuação foi: ", pontos, "\n")
			escreva("|---------------------------------|\n")
			
		}senao{
			escreva("|---------------------------------|\n")
			escreva("| Fim de Jogo! Sua munição acabou |\n")
			escreva("| Sua pontuação foi: ", pontos, "\n")
			escreva("|---------------------------------|\n")
		}
		se(pontos > recorde) {
			escreva("| NOVO RECORDE ESTABELECIDO!      |\n")
			escreva("|---------------------------------|\n")
			recorde = pontos
			u.aguarde(3000)
			limpa()
		}senao{
			escreva("| Recorde a bater: ", recorde, " pontos!\n")
			escreva("|---------------------------------|\n")
			u.aguarde(3000)
			limpa()
		}

		municao = 0
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
		u.aguarde(8000)
		limpa()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5754; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */