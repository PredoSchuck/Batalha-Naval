programa{
	inclua biblioteca Util --> u
	
	cadeia oceano[4][4]
	cadeia gabarito[4][4]

	inteiro opcao = 0
	
	inteiro l, c
	
	funcao inicio(){
		enquanto(opcao != 3) {
			escreva("--- BATALHA NAVAL ---\n")
			escreva("1. Jogar\n")
			escreva("2. Regras\n")
			escreva("3. Sair\n")
			escreva("Escolha: ")
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
					escreva("Opção inválida! Tente novamente.\n")
			}
		}
	}

	// Exibir as regras do jogo

	funcao exibir_regras() {
		escreva("--- REGRAS ---\n")
		escreva("[~] Água desconhecida\n")
		escreva("[*] Fogo! (Navio atingido)\n")
		escreva("[A] Água (Tiro errado)\n")
		escreva("Você tem 5 munições para achar 3 navios.\n\n")
	}
	
	// preencha o mapa com água, colocando nos 16 "espaços" o simbolo ~
	funcao vazio preencher_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				oceano[l][c] = "~"
			}
		}
	}

	// exiba o mapa para o jogador, demosntrando apenas o simbolo ~
	funcao vazio exibir_mar(){
		para(l = 0; l < 4; l++) {
			para(c = 0; c < 4; c++) {
				escreva(oceano[l][c], " ")
			}
			escreva("\n")
		}
	}

	
	funcao jogar() {

		// declarando as regras do jogo
		
		inteiro municao = 5
		inteiro naviosRestantes = 3
		inteiro linhaTiro, colunaTiro

		// preenchendo o mapa da batalha naval
		
		preencher_mar()
		
		escreva("O jogo começou! O mar foi gerado.\n")

		enquanto(municao > 0 e naviosRestantes > 0) {
			exibir_mar()
			escreva("\nMunição restante: ", municao)
			escreva("\nNavios restantes: ", naviosRestantes)

			// selecionar uma linha e uma coluna entre 1 a 4
			
			escreva("\nDigite a Linha (1-4): ")
			leia(linhaTiro)
			linhaTiro = linhaTiro - 1
			escreva("Digite a Coluna (1-4): ")
			leia(colunaTiro)
			colunaTiro = colunaTiro - 1
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1724; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */