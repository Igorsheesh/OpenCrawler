if instance_exists(hitboxid)
    instance_destroy(hitboxid, false)
with (instance_create_layer(x, y, "Instances", obj_lock_dead))
    sprite_index = other.spr_dead
global.points += 10
global.killedbaddies++
ds_list_add(global.saveroom, id)
