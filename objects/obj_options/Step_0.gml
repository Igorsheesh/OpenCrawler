if ((!keyset) && (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(global.key_interact) || gamepad_button_check_pressed(playernum, gp_face2)))
{
    instance_destroy(self)
    if keyboard_check_pressed(global.key_interact)
        keyboard_key_release(global.key_interact)
    if gamepad_button_check_pressed(playernum, gp_face2)
        global.pausedisable2 = 1
}
if ((!keyset) && (keyboard_check_pressed(global.key_punch) || gamepad_button_check_pressed(playernum, gp_face1)))
{
    if (select == 0)
        instance_destroy(self)
    else if (select == (array_length(keys) + 1))
    {
        ini_open("settings.ini")
        ini_write_string("Controls", "fullscreen", (!window_get_fullscreen()))
        ini_close()
        window_set_fullscreen((!window_get_fullscreen()))
    }
    else if (select == (array_length(keys) + 2))
    {
        ini_open("settings.ini")
        vol = ini_read_real("volume", "master", 1)
        ini_close()
        if ((keyboard_check(global.key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && global.controllerinputcooldown < 0)
            vol += 0.1
        else if ((keyboard_check(global.key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && global.controllerinputcooldown < 0)
            vol -= 0.1
    }
    else
    {
        keyset = 1
        global.pausedisable = 1
    }
}
if ((!keyset) && (keyboard_check_pressed(global.key_up) || (gamepad_axis_value(playernum, gp_axislv) < 0 && global.controllerinputcooldown < 0)))
    select = max(0, (select - 1))
if ((!keyset) && (keyboard_check_pressed(global.key_down) || (gamepad_axis_value(playernum, gp_axislv) > 0 && global.controllerinputcooldown < 0)))
    select = min((array_length(keys) + 1), (select + 1))
if (keyset && keyboard_key != vk_nokey && (!global.pausedisable))
{
    var press = keyboard_key
    ini_open("settings.ini")
    for (var i = 0; i < array_length(keys); i++)
    {
        if (i != (select - 1) && variable_global_get(("key_" + keys[i])) == press)
        {
            ini_write_string("Controls", keys[i], variable_global_get(("key_" + keys[(select - 1)])))
            variable_global_set(("key_" + keys[i]), variable_global_get(("key_" + keys[(select - 1)])))
        }
    }
    ini_write_string("Controls", keys[(select - 1)], press)
    ini_close()
    variable_global_set(("key_" + keys[(select - 1)]), press)
    keyset = 0
}
if ((global.pausedisable && keyboard_check_released(global.key_punch)) || gamepad_button_check_released(playernum, gp_face1))
    global.pausedisable = 0
tilex += 1
tiley += 1
if (vol > 1)
    vol = 1
if (vol < 0)
    vol = 0
