if (room == rm_playtest)
{
    var found = -1
    with (obj_editor)
    {
        var i = 0
        while (i < array_length(rooms))
        {
            if (rooms[i] == string_upper(other.target_room))
            {
                found = i
                break
            }
            else
            {
                i++
                continue
            }
        }
        if (found > -1)
        {
            var origmu = mu[curroom]
            curroom = found
            if (origmu != mu[curroom])
            {
                audio_stop_sound(player)
                player = undefined
            }
            room_set_width(rm_playtest, levelwidth[curroom])
            room_set_height(rm_playtest, levelheight[curroom])
            room_goto(rm_playtest)
        }
    }
    if (found < 0)
        return;
}
else
    room_goto(target_room)
if variable_instance_exists(id, "target_door")
{
    target_door = string_upper(target_door)
    with (obj_player)
        target_door = other.target_door
}
else
{
    with (obj_player)
    {
        x = other.targetx
        y = other.targety
    }
    with (obj_camera)
    {
        x = other.targetx
        y = other.targety
    }
}
if (room == Tutorial_1)
{
    other.haskey = 0
    global.level1unlock = 1
    if (!global.challengemodeunlock)
    {
        with (instance_create_layer(x, y, "Instances", obj_notif))
            notiftext = "PIZZA DUNGEON UNLOCKED!"
    }
    ini_open("savedata.ini")
    ini_write_string("levelunlocks", "levelone", 1)
    ini_close()
}
