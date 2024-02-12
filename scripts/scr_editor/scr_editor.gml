function scr_exitplaytest() //gml_Script_scr_exitplaytest
{
    with (obj_editor)
    {
        if (array_length(global.returneditor) > 1)
        {
            globalplayerreset()
            var origmu = mu[curroom]
            curroom = global.returneditor[(array_length(global.returneditor) - 2)]
            array_delete(global.returneditor, (array_length(global.returneditor) - 1), 1)
            with (obj_player)
            {
                if (array_length(global.returndoor) > 1)
                    target_door = global.returndoor[(array_length(global.returndoor) - 2)]
                else if (object_index != obj_player2 || (!other.spawn[4]))
                {
                    x = other.spawn[0]
                    y = other.spawn[1]
                }
                else
                {
                    x = other.spawn[2]
                    y = other.spawn[3]
                }
            }
            array_delete(global.returndoor, (array_length(global.returndoor) - 1), 1)
            if (origmu != mu[curroom])
            {
                audio_stop_sound(player)
                player = undefined
            }
            global.leveltosave = (global.returnlevel[(array_length(global.returnlevel) - 2)] + "_editor")
            array_delete(global.returnlevel, (array_length(global.returnlevel) - 1), 1)
            global.custompoints = global.returnpoint[(array_length(global.returnpoint) - 2)]
            array_delete(global.returnpoint, (array_length(global.returnpoint) - 1), 1)
            global.customkilledbaddies = global.returnbaddie[(array_length(global.returnbaddie) - 2)]
            array_delete(global.returnbaddie, (array_length(global.returnbaddie) - 1), 1)
            room_set_width(rm_playtest, levelwidth[curroom])
            room_set_height(rm_playtest, levelheight[curroom])
            room_goto(rm_playtest)
            return;
        }
        playtest = 0
        instance_destroy(obj_player)
        instance_destroy(obj_camera)
        global.coop = 0
        global.panic = 0
        curroom = home
        if player
        {
            audio_stop_sound(player)
            player = undefined
            audio_resume_all()
        }
        if audio_is_playing(mus_shop)
        {
            audio_stop_sound(mus_shop)
            if (!player)
                audio_resume_all()
        }
        room_goto(rm_editor)
    }
}

function scr_asset_get_index(argument0, argument1) //gml_Script_scr_asset_get_index
{
    if (argument1 == undefined)
        argument1 = 0
    if (asset_get_type(argument0) == -1)
    {
        var found = undefined
        if (argument1 == 0 || argument1 == 1)
        {
            var k = 0
            while (k < array_length(global.sprites))
            {
                if (global.sprites[k][1] == argument0)
                {
                    found = global.sprites[k][0]
                    break
                }
                else
                {
                    k++
                    continue
                }
            }
        }
        if (argument1 == 0 || argument1 == 2)
        {
            k = 0
            while (k < array_length(global.sounds))
            {
                if (global.sounds[k][1] == argument0)
                {
                    found = global.sounds[k][0]
                    break
                }
                else
                {
                    k++
                    continue
                }
            }
        }
        return found;
    }
    else
        return asset_get_index(argument0);
}

function scr_lightscroll() //gml_Script_scr_lightscroll
{
    with (obj_editor)
    {
        if (highlight < 0)
            return 0;
        var instance = roomobjects[curroom][highlight]
        var spr = objects[instance[0]][1]
        var llx = (instance[1] - (sprite_get_xoffset(spr) * instance[3]))
        var rrx = (llx + (sprite_get_width(spr) * instance[3]))
        var uuy = (instance[2] - (sprite_get_yoffset(spr) * instance[4]))
        var ddy = (uuy + (sprite_get_height(spr) * instance[4]))
        var rx = max(llx, rrx)
        var uy = min(uuy, ddy)
        var prevlightscroll = lightscroll
        if (mouse_xadjust >= guiwidth && mouse_x >= rx && mouse_x < (rx + 384) && mouse_y >= uy && mouse_y < (uy + 256))
            lightscroll = median(0, ((lightscroll + mouse_wheel_down()) - mouse_wheel_up()), max(0, ((((array_length(instance) - 9) + array_length(objects[instance[0]])) / 2) - 7)))
        return prevlightscroll != lightscroll;
    }
}

