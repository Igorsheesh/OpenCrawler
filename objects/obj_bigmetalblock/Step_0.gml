if (hp <= 0)
    instance_destroy(self)
hurtable--
if (hp == 4 || hp == 3)
    sprite_index = spr_metalblock_big_hurt
else if (hp == 1 || hp == 2)
    sprite_index = spr_metalblock_big_damaged
else
    sprite_index = spr_metalblock_big
if destroytiles
    visible = false
