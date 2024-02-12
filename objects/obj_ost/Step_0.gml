cooldown--
playcooldown--
lowcool--
scr_getinput()
if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && playcooldown <= 0)
{
    play_music(songs[songselect])
    songplaying = songselect
}
if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable))
    audio_stop_all()
if ((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && cooldown <= 0)
{
    songselect++
    cooldown = 15
}
if ((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && cooldown <= 0)
{
    songselect--
    cooldown = 15
}
if keyboard_check_pressed(vk_escape)
    room_goto(Titlescreen)
songselect = clamp(songselect, 0, (array_length(songs) - 1))
if audio_is_playing(songs[songplaying])
{
    if (!low)
        var _random = irandom(30)
    else
        _random = irandom(1000)
    if (_random >= 20 && (!low))
        instance_create(0, 1080, obj_ostgremlins)
    else if (_random >= 900)
        instance_create(0, 1080, obj_ostgremlins)
}
else if instance_exists(obj_ostgremlins)
{
    with (obj_ostgremlins)
        image_alpha -= 0.1
}
if ((keyboard_check(key_mach) || gamepad_button_check(playernum, gp_shoulderr)) && lowcool <= 0)
{
    low *= -1
    lowcool = 20
}
