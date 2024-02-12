global.classicmode = 0
global.font = font_add_sprite_ext(spr_fnt_crawlerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?()#1234567890:@-_.abcdefghijklmnopqrstuvwxyz", 0, -18)
global.timerfont = font_add_sprite_ext(spr_fnt_timer_font, "1234567890:", 0, -21)
function play_music(argument0) //gml_Script_play_music
{
    if (!audio_is_playing(argument0))
    {
        if (argument0 == 10 && room == rm_playtest)
        {
            if obj_editor.player
                audio_pause_sound(obj_editor.player)
            else
                audio_pause_all()
        }
        else if (argument0 == 10 && object_index == obj_music)
        {
            if music
                audio_pause_sound(music)
            else
            {
                audio_pause_all()
                audio_resume_sound(sfx_walk)
                audio_resume_sound(sfx_run)
            }
        }
        else
            audio_stop_all()
        if (argument0 == 20)
            audio_play_sound(argument0, 5, true, 0.5)
        else
            audio_play_sound(argument0, 5, true)
    }
}

function play_sound(argument0) //gml_Script_play_sound
{
    audio_play_sound(argument0, 3, false)
}

function play_sound_unique(argument0) //gml_Script_play_sound_unique
{
    if (!audio_is_playing(argument0))
        play_sound(argument0)
}

function instance_create(argument0, argument1, argument2) //gml_Script_instance_create
{
    instance_create_layer(argument0, argument1, "Instances", argument2)
}

function instance_create_unique(argument0, argument1, argument2) //gml_Script_instance_create_unique
{
    if (!instance_exists(argument2))
        instance_create_layer(argument0, argument1, "Instances", argument2)
}

function ishubroom() //gml_Script_ishubroom
{
    if (room == rm_hub1 || room == rm_hub_1 || room == Tutorial_1 || room == rm_levelselect || room == rm_credits || room == rm_hub_lounge)
        return 1;
    else
        return 0;
}

function globalplayerreset() //gml_Script_globalplayerreset
{
    if instance_exists(obj_player)
    {
        with (obj_player)
            player_reset()
        if (global.coop && instance_exists(obj_player2))
        {
            with (obj_player2)
                player_reset()
        }
    }
}

function depthset(argument0) //gml_Script_depthset
{
    if (argument0 != 4)
    {
        if instance_exists(argument0)
        {
            with (argument0)
            {
                if (y >= other.y)
                    depth = (other.depth - 1)
                else
                    depth = (other.depth + 1)
            }
        }
    }
    else if instance_exists(argument0)
    {
        with (argument0)
        {
            if (realy >= other.y)
                depth = (other.depth - 1)
            else
                depth = (other.depth + 2)
        }
    }
}

function alldepthset() //gml_Script_alldepthset
{
    depthset(38)
    if instance_exists(obj_player2)
        depthset(88)
    depthset(69)
    depthset(4)
    depthset(23)
    depthset(5)
}

function set_state(argument0) //gml_Script_set_state
{
    obj_player.state = argument0
    if global.coop
        obj_player2.state = argument0
}

function draw_textbox() //gml_Script_draw_textbox
{
    if (!instance_exists(obj_textbox))
    {
        with (instance_create_layer(0, 0, "Instances", obj_textbox))
        {
            intID = other.id
            depth = (other.depth + 1)
        }
    }
}

function set_text(argument0, argument1, argument2, argument3) //gml_Script_set_text
{
    if (argument0 != undefined)
        draw_set_font(argument0)
    if (argument1 != undefined)
        draw_set_color(argument1)
    if (argument2 != undefined)
        draw_set_halign(argument2)
    if (argument3 != undefined)
        draw_set_valign(argument3)
}

function haskey() //gml_Script_haskey
{
    if (!global.coop)
    {
        if obj_player.haskey
            return 1;
        else
            return 0;
    }
    else if (obj_player.haskey || obj_player2.haskey)
        return 1;
    else
        return 0;
}

function darkdraw() //gml_Script_darkdraw
{
    gpu_set_blendmode(bm_subtract)
    var scale = 1
    var sprite = spr_torchlight
    with (obj_torch)
        draw_sprite_ext(sprite, -1, x, y, scale, scale, 0, c_white, 1)
    with (obj_player)
    {
        if (!firetran)
            draw_sprite_ext(sprite, 0, x, y, scale, scale, 0, c_white, 1)
        else
            draw_sprite_ext(sprite, -1, x, y, 2, 1.5, 0, c_white, 1)
    }
    with (obj_shoparea)
        draw_sprite_ext(Sprite306, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
    gpu_set_blendmode(bm_normal)
}

function isholiday(argument0) //gml_Script_isholiday
{
    return 1;
}

