scr_getinput()
if (global.pausedisable && gamepad_button_check_released(playernum, gp_face1))
    global.pausedisable = 0
if (global.pausedisable2 && gamepad_button_check_released(playernum, gp_face2))
    global.pausedisable2 = 0
palselect = scr_overflow(palselect, 1, (sprite_get_width(spr_pal) - 1))
if ((!palgenerated) || palselect != prevpalselect)
{
    palarray = scr_paltoarr(spr_pal, palselect)
    show_debug_message(palarray)
    palgenerated = 1
    prevpalselect = palselect
}
switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_mach()
        break
    case (2 << 0):
        scr_player_actor()
        break
    case (3 << 0):
        scr_player_punch()
        break
    case (4 << 0):
        scr_player_hurt()
        break
    case (5 << 0):
        scr_player_cutscene()
        break
    case (7 << 0):
        break
    case (8 << 0):
        if keyboard_check(vk_up)
            y -= 5
        if keyboard_check(vk_down)
            y += 5
        if keyboard_check(vk_right)
            x += 5
        if keyboard_check(vk_left)
            x -= 5
        sprite_index = spr_idle
        break
}

var _right = (keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0)
var _left = (keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0)
var _up = (keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0)
var _down = (keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0)
if (!inputlocked)
{
    var _xinput = (_right - _left)
    var _yinput = (_down - _up)
}
if global.classicmode
{
    if (!inputlocked)
    {
        if (_xinput != 0)
        {
            if (!(place_meeting((x + (32 * _xinput)), y, obj_solid)))
            {
                inputlocked = 1
                x += (32 * _xinput)
                alarm_set(0, 20)
            }
        }
        if (_yinput != 0)
        {
            if (!(place_meeting(x, (y + (32 * _yinput)), obj_solid)))
            {
                inputlocked = 1
                y += (32 * _yinput)
                alarm_set(0, 20)
            }
        }
    }
}
else
    move_and_collide((_xinput * movespeed), (_yinput * movespeed), 28)
if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && state != (2 << 0))
{
    if (object_index == obj_player)
    {
        if (!instance_exists(obj_interacthitbox))
            instance_create_layer(x, y, "Instances", obj_interacthitbox)
    }
    else if (!instance_exists(obj_interacthitboxp2))
        instance_create_layer(x, y, "Instances", obj_interacthitboxp2)
}
if ((keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(playernum, gp_start)) && (!instance_exists(obj_pause)))
{
    if (room == rm_playtest && obj_editor.playtest < 2)
        scr_exitplaytest()
    else
        instance_create_layer(x, y, "Instances", obj_pause)
}
if (stamina > maxstamina)
    stamina = maxstamina
if (stamina < 0)
    stamina = 0
if (playerhp > 3)
    playerhp = 3
if (state == (1 << 0) || state == (3 << 0))
{
    if (stamina <= 0)
        state = (0 << 0)
    stamina -= 0.1
}
else
    stamina += 0.4
if (hp > maxhp)
    hp = maxhp
if (hp < 0)
    hp = 0
if (object_index == obj_player2)
    playernum = (obj_player.playernum + 1)
if (keyboard_check(key_left) || gamepad_axis_value(playernum, gp_axislh) < 0)
    leftpress = 1
else
    leftpress = 0
if (keyboard_check(key_right) || gamepad_axis_value(playernum, gp_axislh) > 0)
    rightpress = 1
else
    rightpress = 0
if (keyboard_check(key_down) || gamepad_axis_value(playernum, gp_axislv) > 0)
    downpress = 1
else
    downpress = 0
if (keyboard_check(key_up) || gamepad_axis_value(playernum, gp_axislv) < 0)
    uppress = 1
else
    uppress = 0
if (hp <= 0 && (!global.coop) && state != (2 << 0))
{
    movespeed = 0
    visible = false
    with (instance_create_layer(x, y, "Instances", obj_lock_dead))
    {
        sprite_index = obj_player.spr_dead
        image_index = 0
    }
    state = (2 << 0)
}
else if (global.coop && hp <= 0 && state != (2 << 0))
{
    movespeed = 0
    sprite_index = spr_sleep
    state = (2 << 0)
}
palswapcooldown--
if (palselect == 0)
    palselect = 1
if instance_exists(obj_camera)
{
    if (obj_camera.follow != 66)
        state = (2 << 0)
}
if global.cheeseslimemode
    maxhp = 1
if (!(place_meeting(x, y, obj_shoparea)))
    global.useshoptheme = 0
if (state == (5 << 0) && (!audio_is_playing(sfx_keygot)) && sprite_index == spr_gustavo_treasure)
{
    movespeed = 2
    state = (0 << 0)
}
if (object_index == obj_player2)
    palselect = 1
if ishubroom()
    stamina = 20
if (room == rm_levelselect)
    state = (2 << 0)
if invincibility
    image_alpha = 0.5
iframes--
if (iframes <= 0)
    invincibility = 0
if global.coop
{
    if instance_exists(obj_player2)
    {
        if (obj_player2.sprite_index == obj_player2.spr_sleep && obj_player.sprite_index == obj_player.spr_sleep)
        {
            if (!dead)
            {
                obj_player.visible = false
                obj_player2.visible = false
                with (instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_lock_dead))
                {
                    sprite_index = obj_player.spr_dead
                    image_index = 0
                }
                with (instance_create_layer(obj_player2.x, obj_player2.y, "Instances", obj_lock_dead))
                {
                    sprite_index = obj_player2.spr_dead
                    image_index = 0
                }
                dead = 1
            }
        }
    }
}
alldepthset()
if firetran
    palselect = 9
if global.debug
{
    if (keyboard_check_released(vk_f5) && state != (8 << 0))
        state = (8 << 0)
    else if (keyboard_check_released(vk_f5) && state == (8 << 0))
        state = (0 << 0)
}
if keyboard_check(vk_f10)
    global.debug = 1
