/* GRAMADO 16 - referencia portavel da fisica da bola.
 * Coordenadas e velocidades em ponto fixo 8.8 (1 pixel = 256 unidades).
 * O modulo serve como especificacao testavel para a futura rotina 65C816.
 */
#include <stdint.h>
#include "ball_logic.h"

static int16_t clamp16(int32_t v) {
    if (v > 32767) return 32767;
    if (v < -32768) return -32768;
    return (int16_t)v;
}

void ball_init(Ball *b, int16_t x, int16_t y) {
    b->x = x; b->y = y; b->vx = 0; b->vy = 0;
    b->frame = 0; b->active = 1;
}

void ball_kick(Ball *b, int16_t vx, int16_t vy) {
    b->vx = vx; b->vy = vy;
}

void ball_update(Ball *b, const BallBounds *a) {
    int32_t x, y;
    if (!b->active) return;
    x = (int32_t)b->x + b->vx;
    y = (int32_t)b->y + b->vy;
    /* Limites do campo: rebate com perda de velocidade. */
    if (x < a->left)  { x = a->left;  b->vx = (int16_t)(-b->vx * 3 / 4); }
    if (x > a->right) { x = a->right; b->vx = (int16_t)(-b->vx * 3 / 4); }
    if (y < a->top)   { y = a->top;   b->vy = (int16_t)(-b->vy * 3 / 4); }
    if (y > a->bottom){ y = a->bottom;b->vy = (int16_t)(-b->vy * 3 / 4); }
    b->x = clamp16(x); b->y = clamp16(y);
    /* Atrito arcade: aproxima cada componente de velocidade de zero. */
    if (b->vx > 0) b->vx = (b->vx > 24) ? b->vx - 24 : 0;
    else if (b->vx < 0) b->vx = (b->vx < -24) ? b->vx + 24 : 0;
    if (b->vy > 0) b->vy = (b->vy > 24) ? b->vy - 24 : 0;
    else if (b->vy < 0) b->vy = (b->vy < -24) ? b->vy + 24 : 0;
    b->frame = (uint8_t)((b->frame + 1) & 3);
}

/* Colisao circular simples. Retorna 1 se a bola entrou no raio do jogador. */
uint8_t ball_touches_player(const Ball *b, int16_t px, int16_t py, uint8_t radius_px) {
    int32_t dx = ((int32_t)b->x - px) / 256;
    int32_t dy = ((int32_t)b->y - py) / 256;
    int32_t r = radius_px;
    return (uint8_t)(dx*dx + dy*dy <= r*r);
}
