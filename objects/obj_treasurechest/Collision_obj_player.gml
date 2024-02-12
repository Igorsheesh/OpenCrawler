with (other)
{
    if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && state == (0 << 0))
    {
        with (other)
        {
            if (sprite_index != spr_open)
                sprite_index = spr_open
        }
    }
}
