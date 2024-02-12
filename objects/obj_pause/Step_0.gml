if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(global.key_interact) || gamepad_button_check_pressed(playernum, gp_face2))
{
    instance_destroy(self)
    if keyboard_check_pressed(global.key_interact)
        keyboard_key_release(global.key_interact)
    if gamepad_button_check_pressed(playernum, gp_face2)
        global.pausedisable2 = 1
}
if (keyboard_check_pressed(global.key_punch) || gamepad_button_check_pressed(playernum, gp_face1))
{
    if (select == 0)
    {
        if gamepad_button_check_pressed(playernum, gp_face1)
            global.pausedisable = 1
        else
            keyboard_key_release(global.key_punch)
    }
    else if (select == 1)
        instance_create_layer(0, 0, "Instances", obj_options)
    else if (select == 2)
    {
        if (room == rm_playtest && array_length(global.returneditor) > 1)
        {
            if gamepad_button_check_pressed(playernum, gp_face1)
                global.pausedisable = 1
            else
                keyboard_key_release(global.key_punch)
            instance_destroy(self)
            scr_exitplaytest()
            return;
        }
        if gamepad_button_check_pressed(playernum, gp_face1)
            global.pausedisable = 1
        else
            keyboard_key_release(global.key_punch)
        audio_stop_sound(mus_pause)
        audio_resume_all()
        instance_activate_all()
        ini_open("savedata.ini")
        ini_write_string("palette", "currentpalette", obj_player.palselect)
        ini_close()
        globalplayerreset()
        instance_destroy(obj_player)
        instance_destroy(obj_camera)
        global.panic = 0
        global.coop = 0
        if (room == rm_playtest)
        {
            if (array_length(global.returneditor) > 1)
                scr_exitplaytest()
            else
            {
                obj_editor.persistent = 0
                room_goto(rm_editor)
            }
        }
        else
            room_goto(Titlescreen)
    }
    else if (select == 3)
    {
        audio_stop_sound(mus_pause)
        audio_resume_all()
        instance_activate_all()
        ini_open("savedata.ini")
        ini_write_string("palette", "currentpalette", obj_player.palselect)
        ini_close()
        globalplayerreset()
        instance_destroy(obj_player)
        instance_destroy(obj_camera)
        global.panic = 0
        global.coop = 0
        if (room == rm_playtest)
        {
            obj_editor.persistent = 0
            room_goto(rm_editor)
        }
        else
            room_goto(Titlescreen)
    }
    else if (select == 4)
    {
        if (room == rm_playtest)
        {
            if gamepad_button_check_pressed(playernum, gp_face1)
                global.pausedisable = 1
            else
                keyboard_key_release(global.key_punch)
            instance_destroy(self)
            array_push(global.returneditor, "filler")
            array_push(global.returndoor, "filler")
            array_push(global.returnlevel, "filler")
            array_push(global.returnpoint, 0)
            array_push(global.returnbaddie, 0)
            scr_exitplaytest()
            return;
        }
        audio_stop_sound(mus_pause)
        audio_resume_all()
        instance_activate_all()
        if gamepad_button_check_pressed(playernum, gp_face1)
            global.pausedisable = 1
        else
            keyboard_key_release(global.key_punch)
        globalplayerreset()
        instance_destroy(obj_player)
        instance_destroy(obj_camera)
        if (room == rm_playtest)
            room_goto(rm_playtest)
        else
            room_goto(rm_hub1)
        global.panic = 0
        global.points = 0
    }
    if (select != 1)
        instance_destroy(self)
}
if (keyboard_check_pressed(global.key_up) || (gamepad_axis_value(playernum, gp_axislv) < 0 && global.controllerinputcooldown < 0))
    select = max(0, (select - 1))
if (keyboard_check_pressed(global.key_down) || (gamepad_axis_value(playernum, gp_axislv) > 0 && global.controllerinputcooldown < 0))
    select = min(4, (select + 1))
tilex += 1
tiley += 1
