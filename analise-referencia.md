# Análise visual da referência enviada

A imagem mostra uma partida Brasil x Itália em um jogo de futebol 3D/2.5D de geração 32-bit, com câmera alta e inclinada. A adaptação para SNES será uma interpretação 2D em tiles e sprites, não uma conversão literal dos gráficos.

## Elementos observáveis

- Placar no topo esquerdo: bandeiras, nomes curtos e resultado 0–0.
- Relógio no topo direito: 4:16, com pequeno ícone de tempo.
- Campo verde com linhas brancas e área de grande penalidade.
- Jogador em destaque perto da bola; goleiro próximo à área.
- Identificação dos jogadores na parte inferior esquerda/direita.
- Radar tático centralizado na parte inferior.

## Adaptação ao SNES

A câmera será elevada em perspectiva oblíqua simulada por escala/tamanho dos sprites e desenho do gramado. O campo será composto por BG tiles; jogadores e bola serão sprites OBJ; HUD e radar serão camadas/tilemaps dedicados. A imagem original não contém dados suficientes para recuperar código, física ou recursos internos do jogo de origem, portanto a implementação será reconstruída como design original.
