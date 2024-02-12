if global.debug
{
    draw_set_font(global.font)
    draw_text(x, (y - 30), string_concat("IFRAMES: ", iframes, "\nINVINCIBLE: ", invincibility))
}
if (room != Titlescreen && room != rm_hub1 && room != Tutorial_1 && (!ishubroom()) && (!instance_exists(obj_rank)))
{
    if (!instance_exists(obj_pause))
    {
        if (object_index != obj_player2)
        {
            if (!global.coop)
            {
                draw_sprite_ext(spr_gustavo_HUD_display_back, 0, 1600, -60, 2, 2, 0, c_white, 1)
                draw_sprite_ext(spr_sprinthud, 0, 1527, 60, max(0, (stamina / maxstamina)), 1, 0, c_white, 1)
                draw_sprite_ext(spr_healthhud, 0, 1527, 156, max(0, (hp / maxhp)), 1, 0, c_white, 1)
                draw_sprite_ext(spr_gustavo_HUD_display, 0, 1600, -60, 2, 2, 0, c_white, 1)
            }
            if global.coop
            {
                draw_sprite_ext(spr_gustavo_HUD_display_back, 0, 660, -60, 2, 2, 0, c_white, 1)
                draw_sprite_ext(spr_sprinthud, 0, 587, 60, max(0, (stamina / maxstamina)), 1, 0, c_white, 1)
                draw_sprite_ext(spr_healthhud, 0, 587, 156, max(0, (hp / maxhp)), 1, 0, c_white, 1)
                draw_sprite_ext(spr_gustavo_HUD_display, 0, 660, -60, 2, 2, 0, c_white, 1)
            }
        }
        if (object_index == obj_player2)
        {
            draw_sprite_ext(spr_brick_HUD_display_back, 0, 1250, -60, 2, 2, 0, c_white, 1)
            draw_sprite_ext(spr_sprinthudbrick, 0, 1420, 60, max(0, (stamina / maxstamina)), 1, 0, c_white, 1)
            draw_sprite_ext(spr_healthhudbrick, 0, 1420, 156, max(0, (hp / maxhp)), 1, 0, c_white, 1)
            draw_sprite_ext(spr_brick_HUD_display, 0, 1250, -60, 2, 2, 0, c_white, 1)
        }
    }
}
