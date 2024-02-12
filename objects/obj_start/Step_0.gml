if (obj_gustitle.x > 3000)
{
    if (startgame == 2)
        room_goto(rm_editor)
    else if (startgame == 3)
        room_goto(rm_ost)
    else
        room_goto(rm_hub1)
}
if startgame
    visible = false
