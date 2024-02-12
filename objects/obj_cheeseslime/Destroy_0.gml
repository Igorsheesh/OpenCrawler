with (instance_create_layer(x, y, "Instances", obj_lock_dead))
    sprite_index = spr_cheeseslime_dead
global.points += 5
global.killedbaddies++
ds_list_add(global.saveroom, id)
