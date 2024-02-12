if global.panic
{
    draw_sprite_ext(spr_escape_timer, -1, 480, 540, 2, 2, 0, c_white, 1)
    draw_set_font(global.timerfont)
    draw_set_color(c_red)
    draw_set_halign(fa_right)
    var truefill = ceil((fill / 12))
    var seconds = (truefill % 60)
    var minutes = string(((truefill - seconds) / 60))
    seconds = (seconds < 10 ? ("0" + string(seconds)) : string(seconds))
    draw_text_transformed(966.5, 974, seconds, 2, 2, 0)
    draw_text_transformed(929, 974, minutes, 2, 2, 0)
    draw_set_font(global.font)
    draw_set_halign(fa_left)
}
