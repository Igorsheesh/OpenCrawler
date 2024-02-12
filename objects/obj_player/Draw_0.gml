scr_palswap_set(palarray)
draw_self()
shader_reset()
if (sprite_index == spr_gustavo_treasure)
{
    var sprtodraw = ((room == rm_playtest && instance_exists(obj_pedestal)) ? obj_pedestal.spr : global.treasuresprite)
    draw_sprite(sprtodraw, 0, (obj_player.x + 18), (obj_player.y - 25))
}
