if (interactcooldown <= 0)
{
    if (locked == 0)
    {
        opened = 1
        ds_list_add(global.saveroom, (-real(id)))
        audio_play_sound(sfx_door, 2, false)
    }
    if (locked == 1)
    {
        if obj_player2.haskey
        {
            locked = 0
            ds_list_add(global.saveroom, id)
            instance_create_layer(x, y, "Instances", obj_lock_dead)
            interactcooldown = 6
            obj_player.haskey = 0
        }
    }
}
