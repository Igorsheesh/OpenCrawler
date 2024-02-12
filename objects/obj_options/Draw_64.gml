draw_sprite_tiled(bg_settings, -1, tilex, tiley)
draw_sprite_ext(spr_pausetext_bg, 0, 940, 620, 3, 4, 0, c_white, 1)
draw_set_font(global.font)
var drawy = (540 - ((array_length(keys) + 2) * 15))
draw_set_halign(fa_center)
for (i = 0; i < (array_length(keys) + 2); i++)
{
    if (select == i)
        draw_set_color(c_yellow)
    else
        draw_set_color(c_white)
    if (i == 0)
        draw_text(960, drawy, "BACK")
    else if (i == (array_length(keys) + 1))
    {
        if window_get_fullscreen()
            draw_text(960, (drawy + (50 * i)), "WINDOWED")
        else
            draw_text(960, (drawy + (50 * i)), "FULLSCREEN")
    }
    else if (i == (array_length(keys) + 2))
        draw_text(960, (drawy + (30 * i)), string_concat("MASTER VOLUME: ", ini_read_real("volume", "master", 1)))
    else
    {
        var curkey = scr_keytostring(variable_global_get(("key_" + keys[(i - 1)])))
        if (curkey == "")
            curkey = "UNKNOWN"
        curkey = string_upper(curkey)
        if (keyset && select == i)
            draw_text(960, (drawy + (50 * i)), (string_upper(keys[(i - 1)]) + ": PRESS KEY"))
        else
            draw_text(960, (drawy + (50 * i)), ((string_upper(keys[(i - 1)]) + ": ") + curkey))
    }
}
draw_set_color(c_white)
draw_set_halign(fa_left)
