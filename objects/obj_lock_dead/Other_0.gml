if (sprite_index == spr_gustavo_dead)
{
    globalplayerreset()
    instance_destroy(obj_camera)
    instance_destroy(obj_player)
    global.panic = 0
    if (room == rm_playtest)
    {
        if (obj_editor.playtest < 2 || array_length(global.returneditor) > 1)
            scr_exitplaytest()
        else
        {
            obj_editor.persistent = 0
            global.coop = 0
            room_goto(rm_editor)
        }
    }
    else
        room_goto(Titlescreen)
}
instance_destroy()
