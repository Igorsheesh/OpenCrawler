scr_getinput()
if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && baddiechangecooldown <= 0)
{
    with (global.selectedcontrol)
    {
        other.controlledid = id
        state = (4 << 0)
    }
}
if (controlledid != noone && (keyboard_check(key_mach) || gamepad_button_check(playernum, gp_shoulderr)))
{
    with (controlledid)
    {
        state = (0 << 0)
        other.controlledid = noone
    }
}
if (controlledid != noone && (!instance_exists(controlledid)))
    controlledid = -4
if instance_exists(obj_enemy)
{
    with (obj_enemy)
    {
        if (state == (4 << 0))
            other.baddiechangecooldown = 500
    }
}
