if (room != Titlescreen)
{
    if ((!instance_exists(obj_pause)) && (!instance_exists(obj_rank)))
    {
        if (!ishubroom())
        {
            draw_set_font(global.font)
            draw_set_color(c_green)
            draw_set_halign(fa_left)
            if (!global.coop)
                draw_text_transformed(40, 36, string_concat("POINTS: ", global.points, "\nBADDIES: ", global.killedbaddies), 1, 1, 0)
            else
                draw_text_transformed(40, 980, string_concat("POINTS: ", global.points, "\nBADDIES: ", global.killedbaddies), 1, 1, 0)
        }
        if (global.coop && room != rm_levelselect)
            draw_sprite_ext(spr_cheesescroll_coop, 0, 960, 0, 1, 1, 0, c_white, 1)
        if (!ishubroom())
        {
            if instance_exists(obj_player)
            {
                if haskey()
                    draw_sprite(spr_key, 0, 1888, 1049)
            }
            if global.coop
            {
                if instance_exists(obj_player2)
                    scr_palswap_set(obj_player2.palarray)
                if (obj_player2.hp <= obj_player2.maxhp && obj_player2.hp >= (obj_player2.maxhp / 2))
                    draw_sprite_ext(spr_brick_HUD, -1, 960, -60, 2, 2, 0, c_white, 1)
                else if (obj_player2.hp <= (obj_player2.maxhp / 2) && obj_player2.hp >= (obj_player2.maxhp / 3))
                    draw_sprite_ext(spr_brick_HUD2hp, -1, 960, -60, 2, 2, 0, c_white, 1)
                else if (obj_player2.hp <= (obj_player2.maxhp / 3))
                    draw_sprite_ext(spr_brick_HUDdevastated, -1, 960, -60, 2, 2, 0, c_white, 1)
                shader_reset()
                scr_palswap_set(obj_player.palarray)
                if (obj_player.hp <= obj_player.maxhp && obj_player.hp >= (obj_player.maxhp / 2))
                    draw_sprite_ext(spr_gustavo_HUD, -1, 960, -60, 2, 2, 0, c_white, 1)
                else if (obj_player.hp <= (obj_player.maxhp / 2) && obj_player.hp >= (obj_player.maxhp / 3))
                    draw_sprite_ext(spr_gustavo_HUD2hp, -1, 960, -60, 2, 2, 0, c_white, 1)
                else if (obj_player.hp <= (obj_player.maxhp / 3))
                    draw_sprite_ext(spr_gustavo_HUD1hp, -1, 960, -60, 2, 2, 0, c_white, 1)
                shader_reset()
            }
            else if (!global.coop)
            {
                if instance_exists(obj_player)
                {
                    scr_palswap_set(obj_player.palarray)
                    if (obj_player.hp <= obj_player.maxhp && obj_player.hp >= (obj_player.maxhp / 2))
                        draw_sprite_ext(spr_gustavo_HUD, -1, 1920, -60, 2, 2, 0, c_white, 1)
                    else if (obj_player.hp <= (obj_player.maxhp / 2) && obj_player.hp >= (obj_player.maxhp / 3))
                        draw_sprite_ext(spr_gustavo_HUD2hp, -1, 1920, -60, 2, 2, 0, c_white, 1)
                    else if (obj_player.hp <= (obj_player.maxhp / 3))
                        draw_sprite_ext(spr_gustavo_HUD1hp, -1, 1920, -60, 2, 2, 0, c_white, 1)
                    shader_reset()
                }
            }
        }
    }
}
