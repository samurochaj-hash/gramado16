# GRAMADO 16 — projeto original de futebol para Super Nintendo

**Estado:** etapa 2 concluída: arte do campo e recursos gráficos SNES gerados. Ainda não é uma ROM `.sfc` jogável/compilada.

O projeto usa a imagem enviada apenas como referência de apresentação: câmera elevada, campo verde, placar no topo, relógio, nomes dos jogadores e radar tático. Código, identidade, equipes fictícias, gráficos e áudio serão originais; não há extração de código ou recursos de *International Superstar Soccer*.

## Objetivo

Criar um jogo arcade de futebol para SNES (Ricoh 5A22 / 65C816), com partidas rápidas, controles responsivos, times selecionáveis, placar, cronômetro, radar e animações em pixel art.

## Estrutura

- `src/main.asm` — ponto de entrada 65C816 e inicialização mínima do console.
- `src/header.asm` — modelo de cabeçalho LoROM e vetores SNES.
- `Makefile` — comandos de montagem com WLA-DX.
- `docs/analise-referencia.md` — leitura dos elementos visuais da imagem enviada.
- `docs/plano-tecnico.md` — arquitetura, controles, memória e etapas de produção.
- `assets/README.md` — especificação dos recursos gráficos/sonoros originais.
- `assets/campo_preview.png` — prévia do gramado 256×224.
- `assets/campo_tiles_4bpp.bin` — tiles SNES 4bpp em formato planar.
- `assets/campo_tilemap_32x28.bin` — mapa de 32×28 tiles.
- `assets/campo_palette_bgr555.bin` — paleta de 16 cores BGR555.
- `assets/ETAPA2_CAMPO.md` — documentação da etapa 2.

## Compilar

Instale WLA-DX (`wla-65816` e `wlalink`) e execute:

```sh
make
```

O resultado esperado será `build/gramado16.sfc`. O alvo de build já está preparado, mas a ROM completa só deve ser considerada pronta depois que os módulos de campo, sprites, HUD, bola, colisão e áudio forem implementados e testados em emulador e hardware compatível.

## Nota de escopo

Esta entrega estabelece a fundação e o roteiro técnico. Não apresenta uma ROM vazia como se fosse um jogo pronto. A próxima etapa de produção é desenhar e carregar o campo e o HUD em tiles SNES, depois adicionar jogadores, bola, IA e regras.
