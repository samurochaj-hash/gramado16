#ifndef GRAMADO16_BALL_LOGIC_H
#define GRAMADO16_BALL_LOGIC_H
#include <stdint.h>
typedef struct { int16_t x,y,vx,vy; uint8_t frame,active; } Ball;
typedef struct { int16_t left,right,top,bottom; } BallBounds;
void ball_init(Ball *b, int16_t x, int16_t y);
void ball_kick(Ball *b, int16_t vx, int16_t vy);
void ball_update(Ball *b, const BallBounds *bounds);
uint8_t ball_touches_player(const Ball *b, int16_t px, int16_t py, uint8_t radius_px);
#endif
