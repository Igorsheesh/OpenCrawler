if (hp <= 0)
    instance_destroy()
hurtable--
if (hp == 2)
    sprite_index = spr_metalblock_hurt
else if (hp == 1)
    sprite_index = spr_metalblock_damaged
else
    sprite_index = spr_metalblock
if destroytiles
    visible = false
