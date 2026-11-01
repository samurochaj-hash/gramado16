; GRAMADO 16 — ponto de entrada 65C816 / SNES LoROM
; Código original. WLA-DX assembler.

.INCLUDE "header.asm"

.BANK 0 SLOT 0
.ORG $0000

Start:
    sei                 ; desabilita IRQ durante a inicialização
    clc
    xce                 ; entra no modo nativo 65C816
    rep #$38            ; A/X/Y em 16 bits, decimal desligado
    ldx #$1FFF
    txs                 ; stack em WRAM
    sep #$20            ; acumulador em 8 bits

    lda #$80
    sta $2100           ; tela em forced blank durante setup
    stz $4200           ; desliga NMI/contadores por enquanto

    ; Modo gráfico 1: BG1/BG2 com prioridade padrão.
    lda #$01
    sta $2105

    ; Base do tilemap BG1 = VRAM $0000; base de chars BG1 = VRAM $0000.
    stz $2107
    stz $210B

    ; Endereço VRAM incrementa após escrita em $2119.
    lda #$80
    sta $2115
    stz $2116
    stz $2117

    ; Limpa 32x32 entradas do tilemap BG1.
    ; Nesta fundação o mapa é intencionalmente neutro; o campo artístico
    ; entra na etapa de tiles/tilemap descrita em docs/plano-tecnico.md.
    rep #$10
    ldx #$0000
ClearMap:
    sep #$20
    stz $2118
    stz $2119
    rep #$10
    inx
    cpx #$0400
    bne ClearMap

    ; Cor de backdrop verde gramado (BGR15: $03E0).
    sep #$20
    stz $2121           ; CGRAM index 0
    lda #$E0
    sta $2122
    lda #$03
    sta $2122

    ; Exibe a tela. A arte real do campo será carregada nas próximas etapas.
    lda #$0F
    sta $2100

MainLoop:
    wai                 ; aguarda interrupção (NMI será ativada com o frame loop)
    bra MainLoop

.INCLUDE "header_vectors.asm"
