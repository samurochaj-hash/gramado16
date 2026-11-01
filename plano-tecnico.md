# Plano técnico — GRAMADO 16

## Alvo de hardware

- Console: Super Nintendo Entertainment System.
- CPU: Ricoh 5A22 / 65C816.
- Vídeo: PPU SNES, tiles 8×8, paletas CGRAM de 15 bits, sprites OBJ.
- ROM: LoROM como alvo inicial; bancos adicionais serão adicionados conforme o conteúdo crescer.
- Tela lógica: 256×224 pixels (modo NTSC padrão); interface desenhada para área segura.

## Modos e composição

1. BG1: gramado, linhas do campo e marcações.
2. BG2: HUD, placar, relógio e painéis de nomes.
3. OBJ: jogadores, árbitro e bola, com prioridade por posição vertical para simular profundidade.
4. Radar: mini-campo com pontos de jogadores e bola, atualizado em cada frame lógico.

## Jogabilidade proposta

- Partida arcade 7 contra 7 na primeira versão para caber no orçamento de sprites e simplificar a IA.
- Estados: menu, seleção de lado, partida, pausa, gol e fim de jogo.
- Ações: passe, chute, corrida e troca do jogador controlado.
- Bola com posse, passe, chute, quique simplificado e detecção de gol/saída.
- IA inicial por zonas: defesa, meio-campo e ataque; evolução posterior para marcação e desmarcação.

## Controles planejados

| Botão | Ação |
|---|---|
| Direcional | mover jogador |
| B | passe / trocar ação contextual |
| Y | chute |
| A | corrida enquanto pressionado |
| X | passe alto |
| L / R | trocar jogador |
| Start | pausar |

## HUD

- Placar e identificadores das equipes no topo.
- Relógio de jogo no topo direito.
- Nome e número do atleta selecionado na parte inferior.
- Radar tático inferior central.
- Indicador simples de posse/força de chute na próxima revisão.

## Orçamento de arte

- Jogadores: sprites 16×24 ou 16×32, 4bpp, animações de corrida, passe, chute e comemoração.
- Bola: sprite 8×8 ou 8×16 com sombra separada.
- Campo: tiles 8×8 em 4bpp; variações de grama para evitar repetição visual.
- HUD: tiles próprios, fonte legível de 8×8 e bandeiras originais simplificadas.
- Paletas: manter contraste entre uniformes e gramado; limitar cores por conjunto de tiles conforme regras da PPU.

## Próximas etapas de implementação

1. Campo completo, linhas, áreas e arquibancada em tiles.
2. HUD, relógio e radar funcionais.
3. Sprites dos atletas e animações básicas.
4. Movimento, bola, passe, chute e colisões.
5. Goleiros, adversários e IA de posicionamento.
6. Menus, seleção de equipes, áudio, regras e testes de desempenho.
7. Montagem da ROM, checksum/header, testes em emuladores e validação em hardware.

## Limitações honestas desta entrega

O arquivo atual é uma fundação de código e especificação, não um jogo final nem uma ROM `.sfc` pronta para jogar. O loop de partida, arte e regras ainda precisam ser implementados. O cabeçalho/vetores e a rotina de inicialização também devem ser validados e ajustados no primeiro build com WLA-DX antes de distribuir uma ROM.
