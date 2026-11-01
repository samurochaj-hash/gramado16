# Etapa 2 — Campo de futebol SNES

Arte-base original em pixel art para BG1 do SNES.

- Tela: 256 x 224 pixels (256 x 224).
- Tiles: 8 x 8 pixels; mapa: 32 x 28 entradas.
- Tiles únicos: 327.
- Gráficos: 4bpp planar SNES (32 bytes por tile).
- Paleta: 16 cores em BGR555 (CGRAM).
- `campo_preview.png`: prévia visual.
- `campo_tiles_4bpp.bin`: dados dos tiles.
- `campo_tilemap_32x28.bin`: tilemap little-endian; bits 0–9 = índice do tile, paleta 0, sem flips.
- `campo_palette_bgr555.bin`: 16 cores BGR555 little-endian.

## Integração pendente

Os binários estão preparados para serem carregados em VRAM/CGRAM por DMA/rotina 65C816. A integração de DMA, o HUD, sprites, bola e testes de emulação fazem parte das próximas etapas. Esta etapa entrega os recursos gráficos, não uma ROM final jogável.
