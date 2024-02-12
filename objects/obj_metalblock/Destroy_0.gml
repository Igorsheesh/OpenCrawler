if (!challenge)
    audio_play_sound(sfx_metalbreak, 3, false)
if challenge
{
    if (!global.challengemodeunlock)
        audio_play_sound(sfx_metalbreak, 3, false)
}
for (var i = 0; i < 4; i++)
{
    if (!destroytiles)
    {
        with (instance_create_layer(x, y, "Instances", obj_lock_dead))
        {
            sprite_index = spr_metalblock_particles
            image_index = i
        }
    }
    else
    {
        with (instance_create_layer(x, y, "Instances", obj_lock_dead))
        {
            sprite_index = spr_block_particles
            image_index = i
        }
    }
}
if destroytiles
{
    var layers = []
    if (room == rm_playtest)
    {
        with (obj_editor)
        {
            for (var layerr = 0; layerr < 5; layerr++)
            {
                if layerprop[curroom][layerr][1]
                    array_push(layers, ("Tiles_" + string((layerr + 1))))
            }
        }
    }
    else
        array_push(layers, "Tiles_Destroyable")
    for (i = 0; i < array_length(layers); i++)
    {
        var cur = layers[i]
        tile_layer_delete_at(cur, (x - 16), (y - 16))
        tile_layer_delete_at(cur, (x + 16), (y + 16))
        tile_layer_delete_at(cur, (x - 16), (y + 16))
        tile_layer_delete_at(cur, (x + 16), (y - 16))
    }
}
if instance_exists(obj_camera)
    obj_camera.shakevalue = 1.5
ds_list_add(global.saveroom, id)
