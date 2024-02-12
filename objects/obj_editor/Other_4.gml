var error;
if (room == rm_playtest)
{
    if ((!global.panic) && audio_is_playing(mus_escape))
    {
        audio_stop_sound(mus_escape)
        if (mu[curroom] == -1)
            player = audio_play_sound(mus_editor, 5, true, 0.5)
    }
    for (var i = 0; i < array_length(roomobjects[curroom]); i++)
    {
        var instance = roomobjects[curroom][i]
        var created = instance_create_layer(instance[1], instance[2], "Instances", objects[instance[0]][0])
        with (created)
        {
            image_xscale = instance[3]
            image_yscale = instance[4]
            image_angle = instance[5]
        }
        if (created.object_index == obj_pedestal)
        {
            with (created)
            {
                if (instance[6] != "")
                    fill = instance[6]
                if (instance[7] != "")
                {
                    var uhh = scr_asset_get_index(instance[7], 1)
                    if uhh
                        spr = uhh
                }
            }
        }
        else if (created.object_index == obj_mrstick)
        {
            with (created)
            {
                if (instance[6] != "")
                {
                    uhh = scr_asset_get_index(instance[6], 1)
                    if uhh
                        idlespr = uhh
                }
                if (instance[7] != "")
                {
                    uhh = scr_asset_get_index(instance[7], 1)
                    if uhh
                        talkspr = uhh
                }
                if (instance[8] != "")
                {
                    text = string_upper(instance[8])
                    challenge = 0
                }
                if (instance[9] != "")
                    panictext = string_upper(instance[9])
                sprite_index = idlespr
            }
        }
        else if (created.object_index == obj_npc_noise)
        {
            with (created)
            {
                if (instance[6] != "")
                {
                    uhh = scr_asset_get_index(instance[6], 1)
                    if uhh
                        statess.idle.left = uhh
                }
                if (instance[7] != "")
                {
                    uhh = scr_asset_get_index(instance[7], 1)
                    if uhh
                        statess.idle.right = uhh
                }
                if (instance[8] != "")
                {
                    uhh = scr_asset_get_index(instance[8], 1)
                    if uhh
                        statess.idle.down = uhh
                }
                if (instance[9] != "")
                {
                    uhh = scr_asset_get_index(instance[9], 1)
                    if uhh
                        statess.idle.up = uhh
                }
                if (instance[10] != "")
                {
                    uhh = scr_asset_get_index(instance[10], 1)
                    if uhh
                        statess.walk.left = uhh
                }
                if (instance[11] != "")
                {
                    uhh = scr_asset_get_index(instance[11], 1)
                    if uhh
                        statess.walk.right = uhh
                }
                if (instance[12] != "")
                {
                    uhh = scr_asset_get_index(instance[12], 1)
                    if uhh
                        statess.walk.down = uhh
                }
                if (instance[13] != "")
                {
                    uhh = scr_asset_get_index(instance[13], 1)
                    if uhh
                        statess.walk.up = uhh
                }
                if (instance[14] != "")
                {
                    uhh = scr_asset_get_index(instance[14], 1)
                    if uhh
                        statess.dead = uhh
                }
                if (instance[15] != "")
                    noise = instance[15]
                sprite_index = statess.idle.down
            }
        }
        else
        {
            for (var j = 3; j < array_length(objects[instance[0]]); j++)
            {
                if (instance[(j + 3)] != "")
                {
                    var convert = instance[(j + 3)]
                    if string_starts_with(convert, "ast::")
                        convert = string_delete(convert, 4, 1)
                    else if string_starts_with(convert, "ast:")
                    {
                        var setto = scr_asset_get_index(string_delete(convert, 1, 4))
                        if setto
                            convert = setto
                    }
                    try_hook(2880, 2916)
                    variable_instance_set(created, objects[instance[0]][j], convert)
                    try_unhook()
                }
            }
        }
        for (j = (array_length(objects[instance[0]]) + 3); j < array_length(instance); j += 2)
        {
            if (instance[j] != "" && instance[(j + 1)] != "")
            {
                convert = instance[(j + 1)]
                if string_starts_with(convert, "ast::")
                    convert = string_delete(convert, 4, 1)
                else if string_starts_with(convert, "ast:")
                {
                    setto = scr_asset_get_index(string_delete(convert, 1, 4))
                    if setto
                        convert = setto
                }
                try_hook(3468, 3504)
                variable_instance_set(created, instance[j], convert)
                try_unhook()
            }
        }
    }
    for (var layerr = 0; layerr < 5; layerr++)
    {
        var lay_id = layer_get_id(("Tiles_" + string((layerr + 1))))
        map_id = layer_tilemap_get_id(lay_id)
        tilemap_tileset(map_id, tilesets[layerprop[curroom][layerr][0]][0])
        tilemap_set_width(map_id, (levelwidth[curroom] / 32))
        tilemap_set_height(map_id, (levelheight[curroom] / 32))
        for (i = 0; i < array_length(roomtiles[curroom][layerr]); i++)
        {
            var data = tilemap_get(map_id, roomtiles[curroom][layerr][i][1], roomtiles[curroom][layerr][i][2])
            data = tile_set_index(data, roomtiles[curroom][layerr][i][0])
            tilemap_set(map_id, data, roomtiles[curroom][layerr][i][1], roomtiles[curroom][layerr][i][2])
        }
    }
    if (bg[curroom] > -1)
    {
        lay_id = layer_get_id("Background")
        var back_id = layer_background_get_id(lay_id)
        if (bg[curroom] >= array_length(bgs))
            layer_background_sprite(back_id, extrabg[(bg[curroom] - array_length(bgs))])
        else
            layer_background_sprite(back_id, bgs[bg[curroom]][0])
        layer_background_blend(back_id, c_white)
    }
    if ((mu[curroom] > -1 || (instance_exists(obj_player) && playtest < 2)) && (!player))
    {
        if global.panic
        {
        }
        else if (playtest == 2 && (!instance_exists(obj_player)))
            audio_stop_all()
        else if (!instance_exists(obj_player))
            audio_pause_all()
        if (mu[curroom] == -1)
            audio_resume_all()
        else if (mu[curroom] >= array_length(mus))
            player = audio_play_sound(extramu[(mu[curroom] - array_length(mus))], 5, true)
        else
            player = audio_play_sound(mus[mu[curroom]][0], 5, true)
    }
    if (mu[curroom] == -1 && playtest == 2 && (!player))
    {
        audio_stop_all()
        player = audio_play_sound(mus_editor, 5, true, 0.5)
    }
    if (!instance_exists(obj_player))
    {
        instance_create_layer(spawn[0], spawn[1], "Instances", obj_player)
        instance_create_layer(spawn[0], spawn[1], "Instances", obj_camera)
        if global.coop
        {
            if spawn[4]
                instance_create_layer(spawn[2], spawn[3], "Instances", obj_player2)
            else
                instance_create_layer(spawn[0], spawn[1], "Instances", obj_player2)
        }
        array_push(global.returneditor, curroom)
        global.leveltosave = (levelname + "_editor")
        array_push(global.returnlevel, levelname)
        array_push(global.returnpoint, global.custompoints)
        array_push(global.returnbaddie, global.customkilledbaddies)
    }
}
else
{
    global.returneditor = []
    global.returndoor = []
    global.returnlevel = []
    global.returnpoint = []
    global.returnbaddie = []
}
