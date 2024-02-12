function scr_player_normal() //gml_Script_scr_player_normal
{
    stamina += 0.01
    movespeed = 2
    if ((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0) && (!((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0))))
        leftpress = 1
    else
        leftpress = 0
    if ((keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0) && (!((keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0))))
        rightpress = 1
    else
        rightpress = 0
    if ((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0) && (!((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0))))
        downpress = 1
    else
        downpress = 0
    if ((keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0) && (!((keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0))))
        uppress = 1
    else
        uppress = 0
    if (leftpress && (!uppress) && (!downpress))
    {
        sprite_index = spr_moveleft
        spr_idle = spr_leftidle
    }
    else if (rightpress && (!uppress) && (!downpress))
    {
        sprite_index = spr_moveright
        isright = 1
        spr_idle = spr_rightidle
    }
    else if (downpress && (!rightpress) && (!leftpress))
    {
        sprite_index = spr_movedown
        spr_idle = spr_idledown
    }
    else if (uppress && (!rightpress) && (!leftpress))
    {
        sprite_index = spr_moveup
        spr_idle = spr_upidle
    }
    else if (uppress && rightpress)
    {
        sprite_index = spr_moveupright
        spr_idle = spr_uprightidle
    }
    else if (uppress && leftpress)
    {
        sprite_index = spr_moveupleft
        spr_idle = spr_upleftidle
    }
    else if (downpress && rightpress)
    {
        sprite_index = spr_movedownright
        spr_idle = spr_downrightidle
    }
    else if (downpress && leftpress)
    {
        sprite_index = spr_movedownleft
        spr_idle = spr_downleftidle
    }
    else
        sprite_index = spr_idle
    if ((keyboard_check(key_mach) || gamepad_button_check(playernum, gp_shoulderr)) && sprite_index != spr_idle && stamina >= 10)
    {
        movespeed = 4
        state = (1 << 0)
        if (object_index != obj_player2)
            instance_create_layer(x, y, "Instances", obj_punchhitbox)
        else
            instance_create_layer(x, y, "Instances", obj_punchhitboxp2)
    }
    if ((keyboard_check(key_punch) || gamepad_button_check(playernum, gp_face1)) && (!global.pausedisable))
    {
        movespeed = 0
        if (spr_idle == spr_upidle)
            sprite_index = spr_punchup
        if (spr_idle == spr_uprightidle)
            sprite_index = spr_punchupright
        if (spr_idle == spr_rightidle)
            sprite_index = spr_punchright
        if (spr_idle == spr_downrightidle)
            sprite_index = spr_punchdownright
        if (spr_idle == spr_idledown)
            sprite_index = spr_punchdown
        if (spr_idle == spr_downleftidle)
            sprite_index = spr_punchdownleft
        if (spr_idle == spr_leftidle)
            sprite_index = spr_punchleft
        if (spr_idle == spr_upleftidle)
            sprite_index = spr_punchupleft
        image_index = 0
        audio_play_sound(sfx_punch, 2, false)
        state = (3 << 0)
        if (object_index != obj_player2)
        {
            with (instance_create_layer(x, y, "Instances", obj_punchhitbox))
            {
                with (other)
                {
                    if (spr_idle == spr_upidle)
                        other.sprite_index = spr_punchhitbox_up
                    if (spr_idle == spr_uprightidle)
                        other.sprite_index = spr_punchhitbox_upright
                    if (spr_idle == spr_rightidle)
                        other.sprite_index = spr_punchhitbox_right
                    if (spr_idle == spr_downrightidle)
                        other.sprite_index = spr_punchhitbox_downright
                    if (spr_idle == spr_idledown)
                        other.sprite_index = spr_punchhitbox_down
                    if (spr_idle == spr_downleftidle)
                        other.sprite_index = spr_punchhitbox_downleft
                    if (spr_idle == spr_leftidle)
                        other.sprite_index = spr_punchhitbox_left
                    if (spr_idle == spr_upleftidle)
                        other.sprite_index = spr_punchhitbox_upleft
                }
            }
        }
        else
        {
            with (instance_create_layer(x, y, "Instances", obj_punchhitboxp2))
            {
                with (other)
                {
                    if (spr_idle == spr_upidle)
                        other.sprite_index = spr_punchhitbox_up
                    if (spr_idle == spr_uprightidle)
                        other.sprite_index = spr_punchhitbox_upright
                    if (spr_idle == spr_rightidle)
                        other.sprite_index = spr_punchhitbox_right
                    if (spr_idle == spr_downrightidle)
                        other.sprite_index = spr_punchhitbox_downright
                    if (spr_idle == spr_idledown)
                        other.sprite_index = spr_punchhitbox_down
                    if (spr_idle == spr_downleftidle)
                        other.sprite_index = spr_punchhitbox_downleft
                    if (spr_idle == spr_leftidle)
                        other.sprite_index = spr_punchhitbox_left
                    if (spr_idle == spr_upleftidle)
                        other.sprite_index = spr_punchhitbox_upleft
                }
            }
        }
    }
    if ((!audio_is_playing(sfx_walk)) && sprite_index != spr_idle)
        audio_play_sound(sfx_walk, 1, false)
}

function scr_player_mach() //gml_Script_scr_player_mach
{
    if (movespeed > 4)
        movespeed -= 0.1
    if (leftpress && (!uppress) && (!downpress))
    {
        sprite_index = spr_machleft
        spr_idle = spr_leftidle
    }
    else if (rightpress && (!uppress) && (!downpress))
    {
        sprite_index = spr_machright
        isright = 1
        spr_idle = spr_rightidle
    }
    else if (downpress && (!rightpress) && (!leftpress))
    {
        sprite_index = spr_machdown
        spr_idle = spr_idledown
    }
    else if (uppress && (!rightpress) && (!leftpress))
    {
        sprite_index = spr_machup
        spr_idle = spr_upidle
    }
    else if (uppress && rightpress && (!leftpress))
    {
        sprite_index = spr_machupright
        spr_idle = spr_uprightidle
    }
    else if (uppress && leftpress && (!rightpress))
    {
        sprite_index = spr_machupleft
        spr_idle = spr_upleftidle
    }
    else if (downpress && rightpress && (!leftpress))
    {
        sprite_index = spr_machdownright
        spr_idle = spr_downrightidle
    }
    else if (downpress && leftpress && (!rightpress))
    {
        sprite_index = spr_machdownleft
        spr_idle = spr_downleftidle
    }
    else
        sprite_index = spr_idle
    if ((!((keyboard_check(key_mach) || gamepad_button_check(playernum, gp_shoulderr)))) || sprite_index == spr_idle)
    {
        state = (0 << 0)
        movespeed = 2
    }
    if ((!audio_is_playing(sfx_run)) && sprite_index != spr_idle)
        audio_play_sound(sfx_run, 1, false)
    if (instance_number(obj_afterimage) < 3)
    {
        if (alarm_get(1) <= 0)
            alarm_set(1, 10)
    }
}

function scr_player_actor() //gml_Script_scr_player_actor
{
    movespeed = 0
    keytimer--
    if ((!audio_is_playing(sfx_keygot)) && sprite_index == spr_peace)
    {
        movespeed = 2
        state = (0 << 0)
        hspeed = 0
        sprite_index = spr_idle
    }
    if (sprite_index == spr_sleep)
    {
        if (object_index == obj_player && object_index != obj_player2)
        {
            if place_meeting(x, y, obj_interacthitboxp2)
            {
                hp = maxhp
                obj_player2.state = (2 << 0)
                obj_player2.visible = false
                image_index = 0
                sprite_index = spr_gusbrick_highfive
            }
        }
        else if place_meeting(x, y, obj_interacthitbox)
        {
            hp = maxhp
            obj_player.state = (2 << 0)
            obj_player.visible = false
            image_index = 0
            sprite_index = spr_gusbrick_highfive
        }
    }
    if (sprite_index == spr_gusbrick_highfive)
    {
        if (floor(image_index) == (image_number - 1))
        {
            obj_player2.state = (0 << 0)
            obj_player.state = (0 << 0)
            obj_player2.visible = true
            obj_player.visible = true
        }
    }
}

function scr_player_punch() //gml_Script_scr_player_punch
{
    movespeed = 0
    stamina -= 0.05
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_idle
        movespeed = 2
        state = (0 << 0)
    }
    if audio_is_playing(sfx_walk)
        audio_stop_sound(sfx_walk)
    if (instance_number(obj_afterimage) < 3)
    {
        if (alarm_get(1) <= 0)
            alarm_set(1, 10)
    }
}

function scr_player_hurt() //gml_Script_scr_player_hurt
{
    movespeed = 0
    if (spr_idle == spr_upidle)
        sprite_index = spr_hurtup
    if (spr_idle == spr_uprightidle)
        sprite_index = spr_hurtupright
    if (spr_idle == spr_rightidle)
        sprite_index = spr_hurtright
    if (spr_idle == spr_downrightidle)
        sprite_index = spr_hurtdownright
    if (spr_idle == spr_idledown)
        sprite_index = spr_hurtdown
    if (spr_idle == spr_downleftidle)
        sprite_index = spr_hurtdownleft
    if (spr_idle == spr_leftidle)
        sprite_index = spr_hurtleft
    if (spr_idle == spr_upleftidle)
        sprite_index = spr_hurtupleft
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_idle
        hp--
        state = (0 << 0)
    }
}

function scr_player_cutscene() //gml_Script_scr_player_cutscene
{
    movespeed = 0
    if (sprite_index != spr_peace && sprite_index != spr_gustavo_treasure)
    {
        var movetoward = point_direction(x, y, obj_pedestal.x, obj_pedestal.y)
        hspeed = lengthdir_x(2, movetoward)
        vspeed = lengthdir_y(2, movetoward)
        if place_meeting(x, y, obj_pedestal)
        {
            audio_play_sound(sfx_keygot, 3, false)
            hspeed = 0
            vspeed = 0
            sprite_index = spr_gustavo_treasure
            obj_pedestal.taken = 1
        }
    }
    if (sprite_index == spr_gustavo_treasure && place_meeting(x, y, obj_pedestal))
    {
        if (!audio_is_playing(sfx_keygot))
        {
            global.panic = 1
            if variable_instance_exists(obj_pedestal.id, "fill")
                obj_camera.fill = obj_pedestal.fill
            else
                obj_camera.fill = 5000
            instance_create_layer(x, -999, "Instances", obj_escapetext)
            sprite_index = spr_idle
            state = (0 << 0)
            if global.coop
            {
                obj_player2.x = obj_player.x
                obj_player2.y = obj_player.y
            }
            obj_camera.anchor1timer = 120
            if (!global.coop)
                obj_camera.follow = 83
        }
    }
}

