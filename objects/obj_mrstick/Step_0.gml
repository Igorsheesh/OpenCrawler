if (!active)
    currentChar = 1
if (!active)
    intbuffer--
else
    intbuffer = 25
if (distance_to_object(obj_player) > 30 && active)
    active = 0
if active
    sprite_index = talkspr
else
    sprite_index = idlespr
if (global.panic && (!panicking))
{
    panicking = 1
    text = panictext
}
if (text == "INSUFFICIENT FUNDS!")
    fundbuffer--
if (challenge && active && (!ishubroom()))
{
    chachingbuffer--
    obj_player.state = (2 << 0)
    with (obj_player)
    {
        if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable) && other.chachingbuffer <= 0 && global.points >= 25)
        {
            global.points -= 25
            audio_play_sound(sfx_chaching, 3, false, 2, -0.5)
            hp++
            state = (0 << 0)
            other.active = 0
            intbuffer = 25
        }
        else if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable) && other.chachingbuffer <= 0 && global.points < 25)
        {
            other.text = "INSUFFICIENT FUNDS!"
            intbuffer = 25
        }
        else if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2))
        {
            state = (0 << 0)
            other.active = 0
            intbuffer = 25
        }
    }
    if (text == "INSUFFICIENT FUNDS!" && fundbuffer <= 0)
    {
        obj_player.state = (0 << 0)
        active = 0
        text = "BUY AN HP UP?\nCOSTS 25 POINTS\n(PUNCH FOR YES  INTERACT FOR NO)"
        fundbuffer = 80
    }
}
