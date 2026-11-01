# Etapa 3 — Sprites de jogadores

Foram criados sprites originais de protótipo em pixel art para Brasil, Itália, goleiros e árbitro.

- Cada quadro mede 16×32 pixels.
- Folha: `jogadores_spritesheet.png` (80×96).
- Prévia ampliada: `jogadores_preview.png`.
- Dados gráficos: `jogadores_tiles_4bpp.bin` (SNES 4bpp planar, 32 bytes por tile).
- Paleta: `jogadores_palette_bgr555.bin` (16 cores BGR555).
- Manifesto: `jogadores_info.json`.

A folha contém quatro quadros de corrida e um chute para cada seleção, além de um goleiro de cada seleção e um árbitro. A animação ainda é um protótipo; não está ligada ao executável do jogo. A integração no PPU/OAM, movimentação, colisões e testes em emulador são etapas posteriores.
