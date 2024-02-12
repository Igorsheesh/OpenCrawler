draw_sprite_tiled(scrollspr, 0, tilex, tiley)
set_text(global.font, 16777215, 1)
draw_text(960, scroll, toptext)
if global.debug
{
    draw_set_halign(fa_left)
    draw_text(x, y, scroll)
}
