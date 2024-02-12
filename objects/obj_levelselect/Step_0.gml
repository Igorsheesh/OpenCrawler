delay--
if (!set)
{
    set = 1
    instance_deactivate_all(true)
}
scr_getinput()
if (room != rm_playtest)
{
    if (select >= levelcount)
        select = levelcount
    if (floorselect > floorcount)
        floorselect = floorcount
    if (select <= 1)
        select = 1
    if (floorselect <= 0)
        floorselect = 0
    coolfactor--
    if ((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && coolfactor <= 0)
        select++
    if ((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && coolfactor <= 0)
        select--
    if (keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0 || keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0)
        coolfactor = 20
    if ((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && vertcool <= 0)
        floorselect--
    if ((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0) && vertcool <= 0)
        floorselect++
    switch select
    {
        case 1:
            global.leveltosave = "pizzadungeon"
            break
        default:
            global.leveltosave = "hub1"
            break
    }

}
else
    global.leveltosave = (editorlevel + "_editor")
if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2))
{
    if (delay <= 0)
    {
        instance_activate_all()
        globalplayerreset()
        switch global.leveltosave
        {
            case "pizzadungeon":
                with (obj_player)
                {
                    target_door = "A"
                    room_goto(lv1_1)
                }
                break
            default:
                if (room != rm_playtest)
                {
                    with (obj_player)
                    {
                        target_door = "A"
                        room_goto(lv1_1)
                    }
                }
                break
        }

        if (room == rm_playtest)
        {
            with (obj_player)
                target_door = string_upper(other.editordoor)
            var found = -1
            with (obj_editor)
            {
                var i = 0
                while (i < array_length(rooms))
                {
                    if (rooms[i] == string_upper(other.editorroom))
                    {
                        found = i
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if (found > -1)
                {
                    var origmu = mu[curroom]
                    curroom = found
                    if (origmu != mu[curroom])
                    {
                        audio_stop_sound(player)
                        player = undefined
                    }
                    array_push(global.returneditor, curroom)
                    array_push(global.returndoor, other.editordoor)
                    array_push(global.returnlevel, other.editorlevel)
                    array_push(global.returnpoint, global.custompoints)
                    array_push(global.returnbaddie, global.customkilledbaddies)
                    room_set_width(rm_playtest, levelwidth[curroom])
                    room_set_height(rm_playtest, levelheight[curroom])
                    room_goto(rm_playtest)
                }
            }
            if (found < 0)
            {
                global.leveltosave = (global.returnlevel[(array_length(global.returnlevel) - 1)] + "_editor")
                global.custompoints = global.returnpoint[(array_length(global.returnpoint) - 1)]
                global.customkilledbaddies = global.returnbaddie[(array_length(global.returnbaddie) - 1)]
                instance_destroy()
            }
        }
    }
}
