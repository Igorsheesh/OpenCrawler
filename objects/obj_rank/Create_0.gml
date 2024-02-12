tilex = 0
tiley = 0
image_speed = 0.2
displayrank = 0
obj_player.state = (2 << 0)
if instance_exists(obj_player2)
    obj_player2.state = (2 << 0)
spr_idle = 126
displaypoints = 0
pointtimer = 180
displayenemykill = 0
killedenemytimer = 120
rank = "D"
delay = 60
displayrankdelay = 366
bg = 0
indexdelay = 1
if (room == rm_playtest || room == rm_editor || instance_exists(obj_editor))
    persistent = 0
if (room == rm_playtest && obj_editor.playtest < 2)
{
    globalplayerreset()
    scr_exitplaytest()
}
else if (room == rm_playtest && array_length(global.returneditor) < 2)
    global.leveltosave = (obj_editor.levelname + "_editor")
if ((!persistent) && room != rm_playtest && (!instance_exists(obj_editor)) && room != rm_editor)
{
    instance_deactivate_all(true)
    instance_activate_object(obj_music)
    instance_activate_object(obj_player)
    instance_activate_object(obj_camera)
    if instance_exists(obj_player2)
        instance_activate_object(obj_player2)
    if (room != rm_playtest)
        room = rm_rankroom
}
ranksound = 0
