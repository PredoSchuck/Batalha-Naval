programa{
	// variaveis globais
	
	cadeia oceano[4][4]

	// executar codigo
	
	funcao inicio(){
		preencher_mar()
		exibir_mar()
	}

	// preencha o mapa com água, colocando nos 16 "espaços" a letra A

	funcao vazio preencher_mar(){
		para(inteiro l = 0; l < 4; l++) {
			para(inteiro c = 0; c < 4; c++) {
				oceano[l][c] = "A"
			}
		}
	}

	// exiba o mapa para o jogador, demosntrando apenas a letra A
	
	funcao vazio exibir_mar(){
		para(inteiro l = 0; l < 4; l++) {
			para(inteiro c = 0; c < 4; c++) {
				escreva(oceano[l][c], " ")
			}
			escreva("\n")
		}
	}
}