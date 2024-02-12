scr_getinput()
if menu
    inputcooldown--
cooldown--
if menu
{
    if (keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0)
        select = 2
    if (keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0)
        select = 1
    if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable) && inputcooldown <= 0)
    {
        if (select == 1)
        {
            menu = 0
            inputcooldown = 60
            set_state((0 << 0))
            cooldown = 180
        }
        else if (select == 2)
        {
            menu = 0
            cooldown = 180
            set_state((0 << 0))
            global.leveltosave = "longchallengeleveljustfordemo"
            if global.coop
            {
                with (obj_player2)
                    target_door = "A"
            }
            with (obj_player)
            {
                target_door = "A"
                room_goto(lcljfd_1)
            }
        }
    }
}
