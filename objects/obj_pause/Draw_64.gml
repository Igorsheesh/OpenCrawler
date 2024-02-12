draw_set_alpha(0.5)
draw_sprite_tiled(spr_pause_bg, -1, tilex, tiley)
draw_set_alpha(1)
draw_sprite(spr_pizzatitle, 0, 960, 130)
draw_sprite(spr_crawlertitle, 0, 960, 300)
draw_sprite_ext(spr_pausetext_bg, 0, 940, 630, 2.1, 2.1, 0, c_white, 1)
draw_set_font(global.font)
draw_set_halign(fa_center)
if global.collectable1
    draw_sprite_ext(spr_collectable1, 1, 30, 30, 4, 4, 0, c_white, 1)
if global.collectable2
    draw_sprite_ext(spr_collectable2, 1, 30, 120, 4, 4, 0, c_white, 1)
if global.collectable3
    draw_sprite_ext(spr_collectable3, 1, 30, 240, 4, 4, 0, c_white, 1)
if global.collectable4
    draw_sprite_ext(spr_collectable4, 1, 30, 360, 4, 4, 0, c_white, 1)
if global.collectable5
    draw_sprite_ext(spr_collectable5, 1, 30, 480, 4, 4, 0, c_white, 1)
if (select == 0)
    draw_set_color(c_yellow)
else
    draw_set_color(c_white)
draw_text(960, 530, "RESUME")
if (select == 1)
    draw_set_color(c_yellow)
else
    draw_set_color(c_white)
draw_text(960, 570, "OPTIONS")
if (select == 2)
    draw_set_color(c_yellow)
else
    draw_set_color(c_white)
draw_text(960, 610, "EXIT LEVEL")
if (select == 3)
    draw_set_color(c_yellow)
else
    draw_set_color(c_white)
draw_text(960, 650, "BACK TO TITLE")
if (select == 4)
    draw_set_color(c_yellow)
else
    draw_set_color(c_white)
draw_text(960, 690, "RESTART")
draw_set_color(c_white)
draw_set_halign(fa_left)
