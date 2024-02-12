if (hp <= 0)
    instance_destroy()
hurtable--
if (hp == 2)
    sprite_index = spr_crate
else if (hp == 1)
    sprite_index = spr_crate
else
    sprite_index = spr_crate
if destroytiles
    visible = false
