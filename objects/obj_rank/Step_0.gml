if (!instance_exists(obj_player))
    instance_destroy()
tilex++
tiley++
pointtimer--
if (pointtimer <= 0)
{
    displaypoints = 1
    killedenemytimer--
}
if (killedenemytimer <= 0)
{
    displayenemykill = 1
    delay--
}
if (delay <= 0)
{
    displayrank = 1
    displayrankdelay--
}
if (displayrankdelay <= 0)
{
    ini_open("savedata.ini")
    if (global.leveltosave == "pizzadungeon")
    {
        if (!global.challengemodeunlock)
        {
            with (instance_create_layer(x, y, "Instances", obj_notif))
                notiftext = "CHALLENGE UNLOCKED\nOST UNLOCKED - DUNGEON CREATOR UNLOCKED"
            global.challengemodeunlock = ini_read_string("pizzadungeon", "beaten", "true")
        }
    }
    if (ini_read_string(global.leveltosave, "rank", "UNBEATEN") == "UNBEATEN")
        ini_write_string(global.leveltosave, "rank", rank)
    switch rank
    {
        case "S":
            ini_write_string(global.leveltosave, "rank", rank)
            ini_write_string(global.leveltosave, "points", global.points)
            ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            ini_write_string(global.leveltosave, "beaten", "true")
            break
        case "A":
            if (ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "S")
            {
                ini_write_string(global.leveltosave, "rank", rank)
                if (ini_read_string(global.leveltosave, "points", 0) < global.points)
                    ini_write_string(global.leveltosave, "points", global.points)
                if (ini_read_string(global.leveltosave, "killedbaddies", 0) < global.killedbaddies)
                    ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            }
            ini_write_string(global.leveltosave, "beaten", "true")
            break
        case "B":
            if (ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "A" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "S")
            {
                ini_write_string(global.leveltosave, "rank", rank)
                if (ini_read_string(global.leveltosave, "points", 0) < global.points)
                    ini_write_string(global.leveltosave, "points", global.points)
                if (ini_read_string(global.leveltosave, "killedbaddies", 0) < global.killedbaddies)
                    ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            }
            ini_write_string(global.leveltosave, "beaten", "true")
            break
        case "C":
            if (ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "B" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "A" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "S")
            {
                ini_write_string(global.leveltosave, "rank", rank)
                if (ini_read_string(global.leveltosave, "points", 0) < global.points)
                    ini_write_string(global.leveltosave, "points", global.points)
                if (ini_read_string(global.leveltosave, "killedbaddies", 0) < global.killedbaddies)
                    ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            }
            ini_write_string(global.leveltosave, "beaten", "true")
            break
        case "D":
            if (ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "C" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "B" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "A" && ini_read_string(global.leveltosave, "rank", "UNBEATEN") != "S")
            {
                ini_write_string(global.leveltosave, "rank", rank)
                if (ini_read_string(global.leveltosave, "points", 0) < global.points)
                    ini_write_string(global.leveltosave, "points", global.points)
                if (ini_read_string(global.leveltosave, "killedbaddies", 0) < global.killedbaddies)
                    ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            }
            ini_write_string(global.leveltosave, "beaten", "true")
            break
        default:
            ini_write_string(global.leveltosave, "rank", rank)
            ini_write_string(global.leveltosave, "points", global.points)
            ini_write_string(global.leveltosave, "killedbaddies", global.killedbaddies)
            ini_write_string(global.leveltosave, "beaten", "true")
            break
    }

    if global.collectable1
        ini_write_real(global.leveltosave, "collect1", 1)
    if global.collectable2
        ini_write_real(global.leveltosave, "collect2", 1)
    if global.collectable3
        ini_write_real(global.leveltosave, "collect3", 1)
    if global.collectable4
        ini_write_real(global.leveltosave, "collect4", 1)
    if global.collectable5
        ini_write_real(global.leveltosave, "collect5", 1)
    if instance_exists(obj_player)
    {
        ini_write_real("playerstats", "level", obj_player.lv)
        ini_write_real("playerstats", "maxhp", obj_player.maxhp)
        ini_write_real("playerstats", "maxstamina", obj_player.maxstamina)
    }
    if (global.coop && instance_exists(obj_player2))
    {
        ini_write_real("player2stats", "level", obj_player2.lv)
        ini_write_real("player2stats", "maxhp", obj_player2.maxhp)
        ini_write_real("player2stats", "maxstamina", obj_player2.maxstamina)
    }
    ini_close()
    with (obj_player)
        player_reset()
    if (room != rm_playtest)
        room = rm_hub1
    else
    {
        with (obj_editor)
        {
            if (array_length(global.returneditor) > 1)
                scr_exitplaytest()
            else
            {
                obj_editor.persistent = 0
                instance_destroy(obj_player)
                instance_destroy(obj_camera)
                global.coop = 0
                global.panic = 0
                shader_reset()
                room_goto(rm_editor)
            }
        }
        return;
    }
    obj_player.x = 896
    obj_player.y = 480
    obj_camera.x = 896
    obj_camera.y = 480
    if global.coop
    {
        with (obj_player2)
            player_reset()
        obj_player2.x = 896
        obj_player2.y = 480
    }
}
if global.coop
    spr_idle = 76
else
    spr_idle = 126
if (global.leveltosave == "pizzadungeon")
{
    if (global.points >= 1000 && global.killedbaddies >= 8)
        rank = "S"
    else if (global.points >= 800 && global.killedbaddies >= 6)
        rank = "A"
    else if (global.points >= 600 && global.killedbaddies >= 6)
        rank = "B"
    else if (global.points >= 400 && global.killedbaddies >= 2)
        rank = "C"
    else
        rank = "D"
}
else if (global.leveltosave == "longchallengeleveljustfordemo")
{
    if (global.points >= 1200 && global.killedbaddies >= 10)
        rank = "S"
    else if (global.points >= 800 && global.killedbaddies >= 6)
        rank = "A"
    else if (global.points >= 600 && global.killedbaddies >= 6)
        rank = "B"
    else if (global.points >= 400 && global.killedbaddies >= 2)
        rank = "C"
    else
        rank = "D"
}
else if string_ends_with(global.leveltosave, "_editor")
{
    if (global.points >= global.custompoints && global.killedbaddies >= global.customkilledbaddies)
        rank = "S"
    else if (global.points >= floor((global.custompoints * 0.8)) && global.killedbaddies >= floor((global.customkilledbaddies * 0.75)))
        rank = "A"
    else if (global.points >= floor((global.custompoints * 0.6)) && global.killedbaddies >= floor((global.customkilledbaddies * 0.75)))
        rank = "B"
    else if (global.points >= floor((global.custompoints * 0.4)) && global.killedbaddies >= floor((global.customkilledbaddies * 0.25)))
        rank = "C"
    else
        rank = "D"
}
else if (global.points >= 1000)
    rank = "S"
else if (global.points >= 800)
    rank = "A"
else if (global.points >= 600)
    rank = "B"
else if (global.points >= 400)
    rank = "C"
else
    rank = "D"
if displayrank
{
    indexdelay--
    if (rank == "D" || rank == "C")
        bg = 3
    else if (rank == "B")
        bg = 2
    else
        bg = 1
    if (indexdelay <= 0)
        image_index = 1
}
if (displayrank && displaypoints && displayenemykill)
    ranksound = 1
else
{
    if audio_is_playing(rank_d)
        audio_stop_sound(rank_d)
    if audio_is_playing(rank_c_b)
        audio_stop_sound(rank_c_b)
    if audio_is_playing(rank_a)
        audio_stop_sound(rank_a)
    if audio_is_playing(rank_s)
        audio_stop_sound(rank_s)
}
