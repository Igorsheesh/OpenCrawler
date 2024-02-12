draw_set_alpha(0.5)
draw_set_alpha(1)
if instance_exists(obj_player)
{
    if (obj_player.firetran && obj_player.object_index != obj_player2)
        draw_sprite_ext(spr_fire, -1, obj_player.x, obj_player.y, 1, 1, 0, c_white, 0.5)
    if (global.coop && obj_player2.firetran)
        draw_sprite(spr_fire, -1, obj_player2.x, obj_player2.y)
}
