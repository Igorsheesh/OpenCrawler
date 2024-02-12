if (sprite_index != spr_pepperman && sprite_index != spr_cursedandy)
    instance_create(x, (y - 10), obj_explosioneffect)
else if (sprite_index == spr_pepperman)
{
    with (instance_create_layer(x, y, "Instances", obj_explosioneffect))
    {
        image_xscale = 2
        image_yscale = 2
    }
}
else if (sprite_index == spr_cursedandy)
{
    with (instance_create_layer(x, y, "Instances", obj_explosioneffect))
    {
        image_xscale = 8
        image_yscale = 8
        image_blend = make_color_rgb(57, 0, 79)
    }
}
audio_play_sound(sfx_explosion, 3, false)
