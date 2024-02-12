function enemynormal() //gml_Script_enemynormal
{
    if (alarm_get(0) <= 0)
        alarm_set(0, 60)
    if (!(place_meeting((x + hsp), y, obj_solid)))
        x += hsp
    else
        hsp = irandom_range((-movespeed), movespeed)
    if (!(place_meeting(x, (y + vsp), obj_solid)))
        y += vsp
    else
        vsp = irandom_range((-movespeed), movespeed)
    if (hsp < 0 && vsp == 0)
        sprite_index = spr_moveleft
    else if (hsp > 0 && vsp == 0)
        sprite_index = spr_moveright
    else if (vsp < 0)
        sprite_index = spr_moveup
    else if (vsp > 0)
        sprite_index = spr_movedown
    if (object_index != obj_cheeseslime)
    {
        if (distance_to_object(instance_nearest(x, y, obj_player)) < 20 && attackcooldown < 0 && instance_nearest(x, y, obj_player).state != (2 << 0) && instance_nearest(x, y, obj_player).state != (5 << 0) && instance_nearest(x, y, obj_player).state != (4 << 0))
        {
            image_index = 1
            if (currentdirection == (2 << 0))
                sprite_index = spr_attackup
            else if (currentdirection == (3 << 0))
                sprite_index = spr_attackupright
            else if (currentdirection == (1 << 0))
                sprite_index = spr_attackright
            else if (currentdirection == (6 << 0))
                sprite_index = spr_attackdownright
            else if (currentdirection == (5 << 0))
                sprite_index = spr_attackdown
            else if (currentdirection == (7 << 0))
                sprite_index = spr_attackdownleft
            else if (currentdirection == (0 << 0))
                sprite_index = spr_attackleft
            else if (currentdirection == (4 << 0))
                sprite_index = spr_attackupleft
            state = (1 << 0)
            attackbuffer = 30
        }
    }
}

function enemyplayerchase() //gml_Script_enemyplayerchase
{
    if (instance_nearest(x, y, obj_player).state == (2 << 0) || instance_nearest(x, y, obj_player).state == (4 << 0) || instance_nearest(x, y, obj_player).state != (5 << 0))
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = (5 << 0)
        state = (0 << 0)
    }
    if (instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y == y)
    {
        sprite_index = spr_chaseright
        hsp = 2
        vsp = 0
        currentdirection = (1 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y > y)
    {
        sprite_index = spr_chasedownright
        hsp = 2
        vsp = 2
        currentdirection = (6 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x > x && instance_nearest(x, y, obj_player).y < y)
    {
        sprite_index = spr_chaseupright
        hsp = 2
        vsp = -2
        currentdirection = (3 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y == y)
    {
        sprite_index = spr_chaseleft
        hsp = -2
        vsp = 0
        currentdirection = (0 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y > y)
    {
        sprite_index = spr_chasedownleft
        hsp = -2
        vsp = 2
        currentdirection = (7 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x < x && instance_nearest(x, y, obj_player).y < y)
    {
        sprite_index = spr_chaseupleft
        hsp = -2
        vsp = -2
        currentdirection = (4 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y > y)
    {
        sprite_index = spr_chasedown
        hsp = 0
        vsp = 2
        currentdirection = (5 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y < y)
    {
        sprite_index = spr_chaseup
        hsp = 0
        vsp = -2
        currentdirection = (2 << 0)
    }
    else if (instance_nearest(x, y, obj_player).x == x && instance_nearest(x, y, obj_player).y == y)
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = (5 << 0)
    }
    else
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = (5 << 0)
        state = (0 << 0)
    }
    if (distance_to_object(instance_nearest(x, y, obj_player)) < 20 && attackcooldown < 0 && instance_nearest(x, y, obj_player).state != (2 << 0) && instance_nearest(x, y, obj_player).state != (5 << 0))
    {
        image_index = 1
        if (currentdirection == (2 << 0))
            sprite_index = spr_attackup
        else if (currentdirection == (3 << 0))
            sprite_index = spr_attackupright
        else if (currentdirection == (1 << 0))
            sprite_index = spr_attackright
        else if (currentdirection == (6 << 0))
            sprite_index = spr_attackdownright
        else if (currentdirection == (5 << 0))
            sprite_index = spr_attackdown
        else if (currentdirection == (7 << 0))
            sprite_index = spr_attackdownleft
        else if (currentdirection == (0 << 0))
            sprite_index = spr_attackleft
        else if (currentdirection == (4 << 0))
            sprite_index = spr_attackupleft
        state = (1 << 0)
        attackbuffer = 30
    }
    else if (distance_to_object(instance_nearest(x, y, obj_player)) > 180)
    {
        sprite_index = spr_idle
        hsp = 0
        vsp = 0
        currentdirection = (5 << 0)
        state = (0 << 0)
    }
}

function enemyattack() //gml_Script_enemyattack
{
    hsp = 0
    vsp = 0
    if (attackbuffer <= 0)
    {
        attacking = 1
        image_index = 2
    }
    else
        image_index = 1
    attackbuffer--
    if (attackbuffer <= -3)
    {
        attackbuffer = 30
        attacking = 0
        attackcooldown = 60
        sprite_index = spr_idle
        state = (0 << 0)
    }
}

function enemycontrolled() //gml_Script_enemycontrolled
{
    scr_getinput()
    if ((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && (!((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0))) && (!((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0))) && (!((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0))))
    {
        sprite_index = spr_moveright
        currentdirection = (1 << 0)
        hsp = 2
    }
    else if ((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0))) && (!((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0))) && (!((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0))))
    {
        sprite_index = spr_moveleft
        currentdirection = (0 << 0)
        hsp = -2
    }
    else if ((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0))) && (!((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0))) && (!((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0))))
    {
        sprite_index = spr_moveup
        currentdirection = (2 << 0)
        vsp = -2
    }
    else if ((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0) && (!((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0))) && (!((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0))) && (!((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0))))
    {
        sprite_index = spr_movedown
        currentdirection = (5 << 0)
        vsp = 2
    }
    else
    {
        vsp = 0
        hsp = 0
    }
    switch object_index
    {
        case obj_mrsock:
            if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable) && attackcooldown <= 0)
            {
                hsp = 0
                vsp = 0
                if (currentdirection == (2 << 0))
                    sprite_index = spr_attackup
                else if (currentdirection == (3 << 0))
                    sprite_index = spr_attackupright
                else if (currentdirection == (1 << 0))
                    sprite_index = spr_attackright
                else if (currentdirection == (6 << 0))
                    sprite_index = spr_attackdownright
                else if (currentdirection == (5 << 0))
                    sprite_index = spr_attackdown
                else if (currentdirection == (7 << 0))
                    sprite_index = spr_attackdownleft
                else if (currentdirection == (0 << 0))
                    sprite_index = spr_attackleft
                else if (currentdirection == (4 << 0))
                    sprite_index = spr_attackupleft
            }
            if (sprite_index == spr_attackup || sprite_index == spr_attackdown || sprite_index == spr_attackleft || sprite_index == spr_attackright)
            {
                attacking = 1
                if (floor(image_index) == (image_number - 1))
                {
                    attacking = 0
                    attackcooldown = 180
                }
            }
            break
    }

}

