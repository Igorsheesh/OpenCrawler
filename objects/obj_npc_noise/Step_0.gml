deadtimer--
var usesprite = statess.walk
if (state != statess.dead)
{
    if (alarm_get(0) <= 0)
        alarm_set(0, 60)
    if ((!(place_meeting((x + hsp), y, obj_solid))) && (!(place_meeting((x + hsp), y, obj_npcsolid))))
        x += hsp
    else
    {
        hsp = irandom_range(-2, 2)
        usesprite = statess.idle
    }
    if ((!(place_meeting(x, (y + vsp), obj_solid))) && (!(place_meeting(x, (y + vsp), obj_npcsolid))))
        y += vsp
    else
    {
        vsp = irandom_range(-2, 2)
        usesprite = statess.idle
    }
    if (hsp != 0 || vsp != 0)
    {
        prevhsp = hsp
        prevvsp = vsp
    }
    else
        usesprite = statess.idle
    if (prevhsp < 0 && prevvsp == 0)
        sprite_index = usesprite.left
    else if (prevhsp > 0 && prevvsp == 0)
        sprite_index = usesprite.right
    else if (prevvsp < 0)
        sprite_index = usesprite.up
    else if (prevvsp > 0)
        sprite_index = usesprite.down
}
else
{
    sprite_index = statess.dead
    hsp = 0
    vsp = 0
    if (deadtimer <= 0)
    {
        sprite_index = statess.idle.down
        state = statess.idle
    }
}
