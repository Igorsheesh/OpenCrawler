if (escape == 1)
{
    if (!global.panic)
        state = (3 << 0)
}
switch state
{
    case (0 << 0):
        enemynormal()
        break
    case (2 << 0):
        enemyplayerchase()
        break
    case (1 << 0):
        enemyattack()
        break
    case (4 << 0):
        enemycontrolled()
        break
    case (3 << 0):
        if (!global.panic)
        {
            hsp = 0
            vsp = 0
            visible = false
        }
        else if global.panic
        {
            visible = true
            state = (0 << 0)
        }
        break
}

if (!(place_meeting((x + hsp), y, obj_solid)))
    x += hsp
if (!(place_meeting(x, (y + vsp), obj_solid)))
    y += vsp
attackcooldown--
if (hitboxid != noone && (!instance_exists(hitboxid)))
    hitboxid = -4
