; Cabeçalho interno no offset $7FC0 (LoROM, 32 KiB).
.ORG $7FC0
.DB "GRAMADO 16           " ; título com 21 caracteres
.DB $20                    ; LoROM, slow ROM
.DB $00                    ; tipo de cartucho
.DB $08                    ; tamanho ROM: 256 Kibit = 32 KiB
.DB $00                    ; SRAM
.DB $01                    ; região: América do Norte (ajustável)
.DB $00                    ; fabricante
.DB $00                    ; versão
.DW $0000                  ; checksum complement (gerado no release)
.DW $0000                  ; checksum (gerado no release)
.DB $00,$00,$00,$00        ; reservado
; Vetores em modo nativo: COP, BRK, ABORT, NMI, reservado, IRQ
.DW $0000,$0000,$0000,$0000,$0000,$0000
.DB $00,$00,$00,$00        ; reservado
; Vetores em modo emulação: COP, reservado, ABORT, NMI, RESET, IRQ/BRK
.DW $0000,$0000,$0000,$0000,$8000,$0000
