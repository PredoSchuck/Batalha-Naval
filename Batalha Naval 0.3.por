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
					escreva("Saindo do sistema... Até logo!\n")
					pare
				caso contrario:
					escreva("| Opção inválida! Tente novamente |\n")
			}
		}
	}

	/*
	 * Função para exibir as regras do Jogo Batalha Naval
	 */

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
		escreva("|            Boa Sorte            |")
	}

	/*
	 * Função para preencher todos os quadrados com água
	 */

	funcao vazio preencher_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				oceano[l][c] = "~"
			}
		}
	}
	
	/*
	 * Função para exibir somente a água no mapa
	 */
	 
	funcao vazio exibir_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				escreva(oceano[l][c], " ")
			}
			escreva("\n")
		}
	}

	
	funcao jogar() {
		
		inteiro municao = 5
		inteiro naviosRestantes = 3
		inteiro linhaTiro, colunaTiro
		
		preencher_mar()
		
		escreva("O jogo começou! O mar foi gerado.\n")

		enquanto(municao >= 0 e naviosRestantes >= 0) {
			exibir_mar()
			escreva("\nMunição restante: ", municao)
			escreva("\nNavios restantes: ", naviosRestantes)
			
			escreva("\nDigite a Linha (0-3): ")
			leia(linhaTiro)
			escreva("Digite a Coluna (0-3): ")
			leia(colunaTiro)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1415; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */