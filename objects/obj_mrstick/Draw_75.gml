if active
{
    draw_textbox()
    if (currentChar < string_length(text))
    {
        if ((room_speed % delay) == 0)
            currentChar++
    }
    draw_set_font(global.font)
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_text_ext(200, 100, string_copy(string_upper(text), 1, currentChar), 40, (sprite_get_width(spr_textbox_idle) * 3.5))
}
