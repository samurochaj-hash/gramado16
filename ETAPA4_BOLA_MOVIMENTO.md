# Etapa 4 — Bola e movimentação

## Entregáveis desta etapa
- Spritesheet original com 4 quadros de animação, cada quadro 16×16 px.
- Tiles SNES 4bpp em formato planar (`assets/bola_tiles_4bpp.bin`).
- Paleta de 16 entradas BGR555 little-endian (`assets/bola_palette_bgr555.bin`).
- Modelo de física de referência em C (`src/ball_logic.c` / `.h`).

## Controles planejados
- Direcional: mover o jogador selecionado.
- Y: passe curto para companheiro próximo.
- X: passe longo.
- B: chute; segurar aumenta a força até o limite definido.
- A: corrida (a integrar com a stamina na etapa de jogadores).

Os controles acima são o mapeamento de projeto; ainda não estão ligados ao loop principal do SNES.

## Física de referência
- Posição e velocidade usam ponto fixo 8.8 (256 unidades por pixel).
- Atualização por quadro: posição += velocidade.
- Atrito arcade reduz cada componente de velocidade em 24 unidades por quadro.
- Bordas do campo refletem a velocidade com 75% de conservação.
- A colisão inicial jogador/bola usa distância circular ao quadrado.
- `frame` percorre 0..3 para selecionar o quadro visual da bola.

## Integração pendente
O modelo C é uma especificação testável e não é executado pelo console SNES. A próxima integração deve portar a rotina para 65C816, alocar estado em WRAM, ler o controle em `$4218/$4219`, carregar os tiles via DMA para VRAM e desenhar a bola como objeto OAM. Também faltam posse, seleção do jogador, goleiro e validação de gols.

## Testes sugeridos
1. Bola parada mantém velocidade zero.
2. Chute para a direita aumenta X.
3. Chute para cima reduz Y (convenção de tela).
4. Atrito reduz a velocidade gradualmente.
5. Contato com a borda inverte a componente correspondente.
6. Colisão jogador/bola retorna verdadeiro dentro do raio e falso fora dele.
