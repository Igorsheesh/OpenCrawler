mouse_xadjust = ((mouse_x - camera_get_view_x(view_camera[0])) * (1920 / camera_get_view_width(view_camera[0])))
mouse_yadjust = ((mouse_y - camera_get_view_y(view_camera[0])) * (1080 / camera_get_view_height(view_camera[0])))
if ((!playtest) && (!dialog))
{
    if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start) || backto == 1)
    {
        if save
        {
            persistent = 0
            if player
            {
                if (mu[curroom] > -1)
                    audio_stop_sound(player)
                player = undefined
                audio_resume_all()
            }
            room_goto(rm_editor)
        }
        else
        {
            dialog = 1
            backto = 1
        }
    }
    if (mouse_check_button_released(mb_left) && leveledge > -1)
        leveledge = -1
    if (mouse_check_button_pressed(mb_left) && mouse_xadjust <= guiwidth && (open > -1 || mouse_yadjust < 128))
    {
        highlight = -1
        lightscroll = 0
        edge = -1
        property = -1
        roomnameedit = -1
    }
    if (mouse_check_button_pressed(mb_left) && (mouse_xadjust > guiwidth || (open == -1 && mouse_yadjust > 127)))
    {
        roomnameedit = -1
        choosehome = 0
        if (selected == 0)
        {
            if keyboard_check(vk_shift)
            {
                spawn[0] = mouse_x
                spawn[1] = mouse_y
            }
            else
            {
                spawn[0] = (floor((mouse_x / 32)) * 32)
                spawn[1] = (floor((mouse_y / 32)) * 32)
            }
            save = 0
        }
        else if (selected == 1)
        {
            if keyboard_check(vk_shift)
            {
                spawn[2] = mouse_x
                spawn[3] = mouse_y
                spawn[4] = 1
            }
            else
            {
                spawn[2] = (floor((mouse_x / 32)) * 32)
                spawn[3] = (floor((mouse_y / 32)) * 32)
                spawn[4] = 1
            }
            save = 0
        }
        else if (selected > -1)
        {
            if keyboard_check(vk_shift)
                array_push(roomobjects[curroom], [selected, mouse_x, mouse_y, 1, 1, 0])
            else
                array_push(roomobjects[curroom], [selected, (floor((mouse_x / 32)) * 32), (floor((mouse_y / 32)) * 32), 1, 1, 0])
            for (var i = 3; i < array_length(objects[selected]); i++)
                array_push(roomobjects[curroom][(array_length(roomobjects[curroom]) - 1)], "")
            save = 0
        }
        else if (tiledx1 > -1)
        {
            if (mouse_x > -1 && mouse_y > -1 && (mouse_x + ((tiledx2 - tiledx1) * 32)) < levelwidth[curroom] && (mouse_y + ((tiledy2 - tiledy1) * 32)) < levelheight[curroom])
            {
                oldx = floor((mouse_x / 32))
                oldy = floor((mouse_y / 32))
                var total = (((tiledx2 - tiledx1) + 1) * ((tiledy2 - tiledy1) + 1))
                var set = []
                for (i = 0; i < total; i++)
                    array_push(set, 0)
                i = 0
                while (i < array_length(roomtiles[curroom][curlayer]))
                {
                    if (roomtiles[curroom][curlayer][i][1] >= oldx && roomtiles[curroom][curlayer][i][1] <= ((oldx + tiledx2) - tiledx1) && roomtiles[curroom][curlayer][i][2] >= oldy && roomtiles[curroom][curlayer][i][2] <= ((oldy + tiledy2) - tiledy1))
                    {
                        var tiled = (((roomtiles[curroom][curlayer][i][1] - oldx) + tiledx1) + (((roomtiles[curroom][curlayer][i][2] - oldy) + tiledy1) * tilesetwidth[curroom][curlayer]))
                        roomtiles[curroom][curlayer][i][0] = tiled
                        var longgg = ((roomtiles[curroom][curlayer][i][1] - oldx) + ((roomtiles[curroom][curlayer][i][2] - oldy) * ((tiledx2 - tiledx1) + 1)))
                        set[longgg] = (i + 1)
                        show_debug_message(("Set at " + string(longgg)))
                        total--
                        if (total == 0)
                            break
                        else
                        {
                            i++
                            continue
                        }
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                var check = 0
                for (var yy = 0; yy < ((tiledy2 - tiledy1) + 1); yy++)
                {
                    for (var xx = 0; xx < ((tiledx2 - tiledx1) + 1); xx++)
                    {
                        tiled = ((tiledx1 + xx) + ((tiledy1 + yy) * tilesetwidth[curroom][curlayer]))
                        if ((!set[check]) && tiled != 0)
                        {
                            array_push(roomtiles[curroom][curlayer], [tiled, (oldx + xx), (oldy + yy)])
                            show_debug_message(("Pushed " + string(check)))
                        }
                        else if (set[check] && tiled == 0)
                        {
                            array_delete(roomtiles[curroom][curlayer], (set[check] - 1), 1)
                            show_debug_message(("Bye Bye'd " + string(check)))
                        }
                        check++
                    }
                }
                save = 0
                tiledrag = 1
            }
        }
        else
        {
            edge = -1
            if (highlight > -1)
            {
                var instance = roomobjects[curroom][highlight]
                var spr = objects[instance[0]][1]
                var llx = (instance[1] - (sprite_get_xoffset(spr) * instance[3]))
                var rrx = (llx + (sprite_get_width(spr) * instance[3]))
                var uuy = (instance[2] - (sprite_get_yoffset(spr) * instance[4]))
                var ddy = (uuy + (sprite_get_height(spr) * instance[4]))
                var lx = min(llx, rrx)
                var rx = max(llx, rrx)
                var uy = min(uuy, ddy)
                var dy = max(uuy, ddy)
                edge = 0
                property = -1
                if (mouse_x >= (llx - 10) && mouse_x < (llx + 10) && mouse_y >= (uuy - 10) && mouse_y < (ddy + 10))
                    edge = 2
                if (mouse_x >= (rrx - 10) && mouse_x < (rrx + 10) && mouse_y >= (uuy - 10) && mouse_y < (ddy + 10))
                    edge = 3
                if (mouse_y >= (uuy - 10) && mouse_y < (uuy + 10) && mouse_x >= (llx - 10) && mouse_x < (rrx + 10))
                {
                    if (edge == 2)
                        edge = 5
                    else if (edge == 3)
                        edge = 6
                    else
                        edge = 1
                }
                if (mouse_y >= (ddy - 10) && mouse_y < (ddy + 10) && mouse_x >= (llx - 10) && mouse_x < (rrx + 10))
                {
                    if (edge == 2)
                        edge = 7
                    else if (edge == 3)
                        edge = 8
                    else
                        edge = 4
                }
                if (edge == 0 && (!keyboard_check(vk_control)) && (!((mouse_x >= lx && mouse_x < rx && mouse_y >= uy && mouse_y < dy))))
                    edge = -1
                else if keyboard_check(vk_control)
                    rememberctrl = 1
                else
                    rememberctrl = 0
                if (edge == -1 && mouse_x >= rx && mouse_x < (rx + 384) && mouse_y >= uy && mouse_y < (uy + 256))
                {
                    edge = 9
                    property = (floor(((mouse_y - uy) / 32)) + lightscroll)
                    var index = (property + 6)
                    if (index >= (array_length(objects[instance[0]]) + 3))
                        index = (((property * 2) - array_length(objects[instance[0]])) + 9)
                    if (index == array_length(instance))
                    {
                        array_push(instance, "")
                        array_push(instance, "")
                        edge = 10
                        save = 0
                    }
                    else if (index > array_length(instance))
                        property = -1
                    else if (index >= (array_length(objects[instance[0]]) + 3))
                    {
                        if (mouse_x > (rx + 352))
                        {
                            array_delete(instance, index, 2)
                            save = 0
                            property = -1
                        }
                    }
                }
                if (edge > -1)
                {
                    grabx = (mouse_x - instance[1])
                    graby = (mouse_y - instance[2])
                    olddir = instance[5]
                    oldface = point_direction(0, 0, grabx, graby)
                }
            }
            if (edge == -1)
            {
                highlight = -1
                lightscroll = 0
                i = (array_length(roomobjects[curroom]) - 1)
                while (i > -1)
                {
                    instance = roomobjects[curroom][i]
                    spr = objects[instance[0]][1]
                    llx = (instance[1] - (sprite_get_xoffset(spr) * instance[3]))
                    rrx = (llx + (sprite_get_width(spr) * instance[3]))
                    uuy = (instance[2] - (sprite_get_yoffset(spr) * instance[4]))
                    ddy = (uuy + (sprite_get_height(spr) * instance[4]))
                    lx = min(llx, rrx)
                    rx = max(llx, rrx)
                    uy = min(uuy, ddy)
                    dy = max(uuy, ddy)
                    if (mouse_x >= lx && mouse_x < rx && mouse_y >= uy && mouse_y < dy)
                    {
                        highlight = i
                        grabx = (mouse_x - instance[1])
                        graby = (mouse_y - instance[2])
                        olddir = instance[5]
                        oldface = point_direction(0, 0, grabx, graby)
                        edge = 0
                        property = -1
                        if (highlight != (array_length(roomobjects[curroom]) - 1))
                        {
                            array_push(roomobjects[curroom], instance)
                            array_delete(roomobjects[curroom], i, 1)
                            highlight = (array_length(roomobjects[curroom]) - 1)
                        }
                        break
                    }
                    else
                    {
                        i--
                        continue
                    }
                }
            }
            if (edge == -1 && spawn[4] && mouse_x >= (spawn[2] - 32) && mouse_x < (spawn[2] + 32) && mouse_y >= (spawn[3] - 32) && mouse_y < (spawn[3] + 32))
                spawn[4] = 0
            else if (edge == -1)
            {
                if (mouse_x > -10 && mouse_x < 10 && mouse_y > -10 && mouse_y < (levelheight[curroom] + 10))
                    leveledge = 2
                if (mouse_x > (levelwidth[curroom] - 10) && mouse_x < (levelwidth[curroom] + 10) && mouse_y > -10 && mouse_y < (levelheight[curroom] + 10))
                    leveledge = 3
                if (mouse_y > -10 && mouse_y < 10 && mouse_x > -10 && mouse_x < (levelwidth[curroom] + 10))
                {
                    if (leveledge == 2)
                        leveledge = 5
                    else if (leveledge == 3)
                        leveledge = 6
                    else
                        leveledge = 1
                }
                if (mouse_y > (levelheight[curroom] - 10) && mouse_y < (levelheight[curroom] + 10) && mouse_x > -10 && mouse_x < (levelwidth[curroom] + 10))
                {
                    if (leveledge == 2)
                        leveledge = 7
                    else if (leveledge == 3)
                        leveledge = 8
                    else
                        leveledge = 4
                }
            }
        }
    }
    else if (mouse_check_button(mb_left) && (highlight > -1 || leveledge > -1))
    {
        if (leveledge > -1)
        {
            if (leveledge == 1 || leveledge == 5 || leveledge == 6)
            {
                levely = min((levelheight[curroom] - 288), (round((mouse_y / 32)) * 32))
                levelheight[curroom] -= levely
                if (levely != 0)
                {
                    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), (camera_get_view_y(view_camera[0]) - levely))
                    save = 0
                }
            }
            if (leveledge == 4 || leveledge == 7 || leveledge == 8)
            {
                var unsaver = levelheight[curroom]
                levelheight[curroom] = max(288, (round((mouse_y / 32)) * 32))
                if (unsaver != levelheight[curroom])
                    save = 0
                if (unsaver > levelheight[curroom])
                    heightless = 1
            }
            if (leveledge == 2 || leveledge == 5 || leveledge == 7)
            {
                levelx = min((levelwidth[curroom] - 480), (round((mouse_x / 32)) * 32))
                levelwidth[curroom] -= levelx
                if (levelx != 0)
                {
                    camera_set_view_pos(view_camera[0], (camera_get_view_x(view_camera[0]) - levelx), camera_get_view_y(view_camera[0]))
                    save = 0
                }
            }
            if (leveledge == 3 || leveledge == 6 || leveledge == 8)
            {
                unsaver = levelwidth[curroom]
                levelwidth[curroom] = max(480, (round((mouse_x / 32)) * 32))
                if (unsaver != levelwidth[curroom])
                    save = 0
                if (unsaver > levelwidth[curroom])
                    widthless = 1
            }
        }
        else if (edge == 0)
        {
            if rememberctrl
            {
                instance = roomobjects[curroom][highlight]
                var newface = point_direction(instance[1], instance[2], mouse_x, mouse_y)
                unsaver = instance[5]
                instance[5] = (((olddir + newface) - oldface) % 360)
                if (!keyboard_check(vk_shift))
                    instance[5] = (floor(((instance[5] / 45) + 0.5)) * 45)
                if (instance[5] != unsaver)
                    save = 0
            }
            else
            {
                var unsaver1 = roomobjects[curroom][highlight][1]
                var unsaver2 = roomobjects[curroom][highlight][2]
                roomobjects[curroom][highlight][1] = (keyboard_check(vk_shift) ? (mouse_x - grabx) : (floor(((mouse_x - grabx) / 32)) * 32))
                roomobjects[curroom][highlight][2] = (keyboard_check(vk_shift) ? (mouse_y - graby) : (floor(((mouse_y - graby) / 32)) * 32))
                if (roomobjects[curroom][highlight][1] != unsaver1 || roomobjects[curroom][highlight][2] != unsaver2)
                    save = 0
            }
        }
        else if (edge < 9)
        {
            instance = roomobjects[curroom][highlight]
            spr = objects[instance[0]][1]
            if (edge == 1 || edge == 5 || edge == 6)
            {
                var unit = sprite_get_height(spr)
                var distance = (((instance[2] - (sprite_get_yoffset(spr) * instance[4])) + (sprite_get_height(spr) * instance[4])) - mouse_y)
                var newscale = (keyboard_check(vk_shift) ? (distance / unit) : round((distance / unit)))
                newscale = (newscale == 0 ? ((instance[4] / abs(instance[4])) * 0.5) : (newscale > 0 ? max(0.5, newscale) : min(-0.5, newscale)))
                unsaver1 = instance[2]
                unsaver2 = instance[4]
                instance[2] = ((((instance[2] - (sprite_get_yoffset(spr) * instance[4])) + (sprite_get_height(spr) * instance[4])) + (sprite_get_yoffset(spr) * newscale)) - (sprite_get_height(spr) * newscale))
                instance[4] = newscale
                if (instance[2] != unsaver1 || instance[4] != unsaver2)
                    save = 0
            }
            if (edge == 4 || edge == 7 || edge == 8)
            {
                unit = sprite_get_height(spr)
                distance = ((mouse_y - instance[2]) + (sprite_get_yoffset(spr) * instance[4]))
                newscale = (keyboard_check(vk_shift) ? (distance / unit) : round((distance / unit)))
                newscale = (newscale == 0 ? ((instance[4] / abs(instance[4])) * 0.5) : (newscale > 0 ? max(0.5, newscale) : min(-0.5, newscale)))
                unsaver1 = instance[2]
                unsaver2 = instance[4]
                instance[2] = ((instance[2] - (sprite_get_yoffset(spr) * instance[4])) + (sprite_get_yoffset(spr) * newscale))
                instance[4] = newscale
                if (instance[2] != unsaver1 || instance[4] != unsaver2)
                    save = 0
            }
            if (edge == 2 || edge == 5 || edge == 7)
            {
                unit = sprite_get_width(spr)
                distance = (((instance[1] - (sprite_get_xoffset(spr) * instance[3])) + (sprite_get_width(spr) * instance[3])) - mouse_x)
                newscale = (keyboard_check(vk_shift) ? (distance / unit) : round((distance / unit)))
                newscale = (newscale == 0 ? ((instance[3] / abs(instance[3])) * 0.5) : (newscale > 0 ? max(0.5, newscale) : min(-0.5, newscale)))
                unsaver1 = instance[1]
                unsaver2 = instance[3]
                instance[1] = ((((instance[1] - (sprite_get_xoffset(spr) * instance[3])) + (sprite_get_width(spr) * instance[3])) + (sprite_get_xoffset(spr) * newscale)) - (sprite_get_width(spr) * newscale))
                instance[3] = newscale
                if (instance[1] != unsaver1 || instance[3] != unsaver2)
                    save = 0
            }
            if (edge == 3 || edge == 6 || edge == 8)
            {
                unit = sprite_get_width(spr)
                distance = ((mouse_x - instance[1]) + (sprite_get_xoffset(spr) * instance[3]))
                newscale = (keyboard_check(vk_shift) ? (distance / unit) : round((distance / unit)))
                newscale = (newscale == 0 ? ((instance[3] / abs(instance[3])) * 0.5) : (newscale > 0 ? max(0.5, newscale) : min(-0.5, newscale)))
                unsaver1 = instance[1]
                unsaver2 = instance[3]
                instance[1] = ((instance[1] - (sprite_get_xoffset(spr) * instance[3])) + (sprite_get_xoffset(spr) * newscale))
                instance[3] = newscale
                if (instance[1] != unsaver1 || instance[3] != unsaver2)
                    save = 0
            }
        }
    }
    else if (mouse_check_button_pressed(mb_right) && highlight > -1 && selected < 0 && tiledx1 < 0 && (mouse_xadjust > guiwidth || (open == -1 && mouse_yadjust > 127)))
    {
        instance = roomobjects[curroom][highlight]
        spr = objects[instance[0]][1]
        llx = (instance[1] - (sprite_get_xoffset(spr) * instance[3]))
        rrx = (llx + (sprite_get_width(spr) * instance[3]))
        uuy = (instance[2] - (sprite_get_yoffset(spr) * instance[4]))
        ddy = (uuy + (sprite_get_height(spr) * instance[4]))
        lx = min(llx, rrx)
        rx = max(llx, rrx)
        uy = min(uuy, ddy)
        dy = max(uuy, ddy)
        if (mouse_x >= rx && mouse_x < (rx + 384) && mouse_y >= uy && mouse_y < (uy + 256))
        {
            edge = -1
            property = (floor(((mouse_y - uy) / 32)) + lightscroll)
            index = (property + 6)
            if (index >= (array_length(objects[instance[0]]) + 3))
            {
                index = (((property * 2) - array_length(objects[instance[0]])) + 9)
                if (index < array_length(instance))
                {
                    edge = 10
                    roomnameedit = -1
                    choosehome = 0
                }
            }
            if (edge == -1)
                property = -1
        }
    }
    if (highlight > -1 && property == -1 && (keyboard_check_pressed(vk_delete) || keyboard_check_pressed(vk_backspace)))
    {
        array_delete(roomobjects[curroom], highlight, 1)
        highlight = -1
        lightscroll = 0
        save = 0
    }
    if (edge > 8 && property > -1)
    {
        index = (property + 6)
        if (index >= (array_length(objects[roomobjects[curroom][highlight][0]]) + 3))
            index = ((((property * 2) - array_length(objects[roomobjects[curroom][highlight][0]])) + 19) - edge)
        roomobjects[curroom][highlight][index] += keyboard_string
        if (keyboard_string != "")
            save = 0
        if keyboard_check_pressed(vk_backspace)
        {
            roomobjects[curroom][highlight][index] = string_delete(roomobjects[curroom][highlight][index], string_length(roomobjects[curroom][highlight][index]), 1)
            keyboard_key_release(vk_backspace)
            save = 0
        }
    }
    if (roomnameedit > -1)
    {
        rooms[roomnameedit] += keyboard_string
        if (keyboard_string != "")
            save = 0
        if keyboard_check_pressed(vk_backspace)
        {
            rooms[roomnameedit] = string_delete(rooms[roomnameedit], string_length(rooms[roomnameedit]), 1)
            keyboard_key_release(vk_backspace)
            save = 0
        }
    }
    else if (roomnameedit < -1)
    {
        keyboard_string = string_digits(keyboard_string)
        if (roomnameedit == -2)
        {
            if (keyboard_string != "")
            {
                global.custompoints = ((global.custompoints * power(10, string_length(keyboard_string))) + real(keyboard_string))
                save = 0
            }
            if keyboard_check_pressed(vk_backspace)
            {
                global.custompoints = floor((global.custompoints / 10))
                keyboard_key_release(vk_backspace)
                save = 0
            }
            global.custompoints = min(9999, global.custompoints)
        }
        else
        {
            if (keyboard_string != "")
            {
                global.customkilledbaddies = ((global.customkilledbaddies * power(10, string_length(keyboard_string))) + real(keyboard_string))
                save = 0
            }
            if keyboard_check_pressed(vk_backspace)
            {
                global.customkilledbaddies = floor((global.customkilledbaddies / 10))
                keyboard_key_release(vk_backspace)
                save = 0
            }
            global.customkilledbaddies = min(99, global.customkilledbaddies)
        }
    }
    if (roomnameedit < 0 && prevroomnameedit > -1)
    {
        if (rooms[prevroomnameedit] == "")
            rooms[prevroomnameedit] = "_"
        rooms[prevroomnameedit] = string_upper(rooms[prevroomnameedit])
        var found = 0
        var times = -1
        var origname = rooms[prevroomnameedit]
        i = 0
        while (i < array_length(rooms))
        {
            if (i != prevroomnameedit && rooms[i] == origname)
            {
                found = 1
                break
            }
            else
            {
                i++
                continue
            }
        }
        var ap = "_"
        if string_ends_with(origname, "_")
            ap = ""
        while found
        {
            found = 0
            times++
            i = 0
            while (i < array_length(rooms))
            {
                if (i != prevroomnameedit && rooms[i] == ((origname + ap) + string(times)))
                {
                    found = 1
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
        }
        if (times > -1)
            rooms[prevroomnameedit] = ((origname + ap) + string(times))
    }
    prevroomnameedit = roomnameedit
    if (mouse_check_button(mb_left) && tiledrag && (oldx != floor((mouse_x / 32)) || oldy != floor((mouse_y / 32))) && mouse_x > -1 && mouse_y > -1 && (mouse_x + ((tiledx2 - tiledx1) * 32)) < levelwidth[curroom] && (mouse_y + ((tiledy2 - tiledy1) * 32)) < levelheight[curroom])
    {
        oldx = floor((mouse_x / 32))
        oldy = floor((mouse_y / 32))
        total = (((tiledx2 - tiledx1) + 1) * ((tiledy2 - tiledy1) + 1))
        set = []
        for (i = 0; i < total; i++)
            array_push(set, 0)
        i = 0
        while (i < array_length(roomtiles[curroom][curlayer]))
        {
            if (roomtiles[curroom][curlayer][i][1] >= oldx && roomtiles[curroom][curlayer][i][1] <= ((oldx + tiledx2) - tiledx1) && roomtiles[curroom][curlayer][i][2] >= oldy && roomtiles[curroom][curlayer][i][2] <= ((oldy + tiledy2) - tiledy1))
            {
                tiled = (((roomtiles[curroom][curlayer][i][1] - oldx) + tiledx1) + (((roomtiles[curroom][curlayer][i][2] - oldy) + tiledy1) * tilesetwidth[curroom][curlayer]))
                roomtiles[curroom][curlayer][i][0] = tiled
                longgg = ((roomtiles[curroom][curlayer][i][1] - oldx) + ((roomtiles[curroom][curlayer][i][2] - oldy) * ((tiledx2 - tiledx1) + 1)))
                set[longgg] = (i + 1)
                show_debug_message(("Set at " + string(longgg)))
                total--
                if (total == 0)
                    break
                else
                {
                    i++
                    continue
                }
            }
            else
            {
                i++
                continue
            }
        }
        check = 0
        for (yy = 0; yy < ((tiledy2 - tiledy1) + 1); yy++)
        {
            for (xx = 0; xx < ((tiledx2 - tiledx1) + 1); xx++)
            {
                tiled = ((tiledx1 + xx) + ((tiledy1 + yy) * tilesetwidth[curroom][curlayer]))
                if ((!set[check]) && tiled != 0)
                {
                    array_push(roomtiles[curroom][curlayer], [tiled, (oldx + xx), (oldy + yy)])
                    show_debug_message(("Pushed " + string(check)))
                }
                else if (set[check] && tiled == 0)
                {
                    array_delete(roomtiles[curroom][curlayer], (set[check] - 1), 1)
                    show_debug_message(("Bye Bye'd " + string(check)))
                }
                check++
            }
        }
        save = 0
    }
    else if (mouse_check_button_released(mb_left) && tiledrag)
        tiledrag = 0
    if (mouse_check_button_pressed(mb_left) && open == 1 && mouse_xadjust < (tilesetwidth[curroom][curlayer] * 32) && mouse_yadjust > 95 && mouse_yadjust < (96 + (tilesetheight[curroom][curlayer] * 32)))
    {
        if (tiledx1 == floor((mouse_xadjust / 32)) && tiledy1 == floor(((mouse_yadjust - 96) / 32)))
        {
            tiledx1 = -1
            tiledy1 = -1
            tiledx2 = -1
            tiledy2 = -1
        }
        else
        {
            tiledx1 = floor((mouse_xadjust / 32))
            tiledy1 = floor(((mouse_yadjust - 96) / 32))
            tiledx2 = tiledx1
            tiledy2 = tiledy1
        }
        highlight = -1
        lightscroll = 0
        selected = -1
        if (tiledx1 > -1)
            tiling = 1
    }
    else if (mouse_check_button(mb_left) && tiling)
    {
        tiledx2 = median(tiledx1, floor((mouse_xadjust / 32)), (tilesetwidth[curroom][curlayer] - 1))
        tiledy2 = median(tiledy1, floor(((mouse_yadjust - 96) / 32)), (tilesetheight[curroom][curlayer] - 1))
    }
    else if (mouse_check_button_released(mb_left) && tiling)
        tiling = 0
    else if (mouse_check_button_pressed(mb_left) && open == 1 && mouse_xadjust < guiwidth && mouse_yadjust > 31)
    {
        if (mouse_yadjust < 64)
        {
            if (mouse_xadjust < 208)
            {
                curlayer -= 1
                if (curlayer < 0)
                    curlayer = 4
            }
            else
            {
                curlayer += 1
                if (curlayer > 4)
                    curlayer = 0
            }
            tiledx1 = -1
            tiledy1 = -1
            tiledx2 = -1
            tiledy2 = -1
        }
        else if (mouse_yadjust < 96)
        {
            if (array_length(roomtiles[curroom][curlayer]) > 0)
            {
                oldx = mouse_xadjust > 207
                dialog = 5
            }
            else
            {
                if (mouse_xadjust < 208)
                {
                    layerprop[curroom][curlayer][0] -= 1
                    if (layerprop[curroom][curlayer][0] < 0)
                        layerprop[curroom][curlayer][0] = (array_length(tilesets) - 1)
                }
                else
                {
                    layerprop[curroom][curlayer][0] += 1
                    if (layerprop[curroom][curlayer][0] > (array_length(tilesets) - 1))
                        layerprop[curroom][curlayer][0] = 0
                }
                tilesetwidth[curroom][curlayer] = (sprite_get_width(tilesets[layerprop[curroom][curlayer][0]][1]) / 32)
                tilesetheight[curroom][curlayer] = (sprite_get_height(tilesets[layerprop[curroom][curlayer][0]][1]) / 32)
                save = 0
                tiledx1 = -1
                tiledy1 = -1
                tiledx2 = -1
                tiledy2 = -1
            }
        }
        else if (mouse_yadjust > (95 + tilesetheight[curroom][curlayer]) && mouse_yadjust < (128 + (tilesetheight[curroom][curlayer] * 32)))
        {
            layerprop[curroom][curlayer][1] = (!layerprop[curroom][curlayer][1])
            save = 0
        }
    }
    if (mouse_check_button_pressed(mb_left) && open == 2 && mouse_xadjust < guiwidth && mouse_yadjust > 31)
    {
        var newlineoverflow = ((mu[curroom] == -1 || mu[curroom] >= array_length(mus)) ? 0 : max(0, ((string_height(mus[mu[curroom]][1]) / 2) - 32)))
        if (mouse_yadjust > 63 && mouse_yadjust < 96)
        {
            if (bg[curroom] >= array_length(bgs))
            {
                found = 0
                for (i = 0; i < array_length(rooms); i++)
                {
                    if (i != curroom && bg[i] == bg[curroom])
                        found = 1
                }
                if (!found)
                {
                    array_delete(extrabg, (bg[curroom] - array_length(bgs)), 1)
                    array_delete(bgname, (bg[curroom] - array_length(bgs)), 1)
                }
                bg[curroom] = -1
            }
            if (mouse_xadjust < 128)
            {
                bg[curroom] -= 1
                if (bg[curroom] < -1)
                    bg[curroom] = (array_length(bgs) - 1)
            }
            else
            {
                bg[curroom] += 1
                if (bg[curroom] > (array_length(bgs) - 1))
                    bg[curroom] = -1
            }
            save = 0
        }
        else if (mouse_yadjust > 127 && mouse_yadjust < 160)
        {
            if (player && mu[curroom] > -1)
                audio_stop_sound(player)
            if (mu[curroom] >= array_length(mus))
            {
                found = 0
                for (i = 0; i < array_length(rooms); i++)
                {
                    if (i != curroom && mu[i] == mu[curroom])
                        found = 1
                }
                if (!found)
                {
                    array_delete(extramu, (mu[curroom] - array_length(mus)), 1)
                    array_delete(muname, (mu[curroom] - array_length(mus)), 1)
                }
                mu[curroom] = -1
            }
            if (mouse_xadjust < 128)
            {
                mu[curroom] -= 1
                if (mu[curroom] < -1)
                    mu[curroom] = (array_length(mus) - 1)
            }
            else
            {
                mu[curroom] += 1
                if (mu[curroom] > (array_length(mus) - 1))
                    mu[curroom] = -1
            }
            if (player && mu[curroom] > -1)
                player = audio_play_sound(mus[mu[curroom]][0], 5, true)
            save = 0
        }
        else if (mouse_yadjust > (159 + newlineoverflow) && mouse_yadjust < (192 + newlineoverflow))
        {
            if player
            {
                if (mu[curroom] > -1)
                    audio_stop_sound(player)
                player = undefined
                audio_resume_all()
            }
            else
            {
                audio_pause_all()
                if (mu[curroom] >= array_length(mus))
                    player = audio_play_sound(extramu[(mu[curroom] - array_length(mus))], 5, true)
                else if (mu[curroom] > -1)
                    player = audio_play_sound(mus[mu[curroom]][0], 5, true)
                else
                    player = sfx_energycollect
            }
        }
        else if (mouse_yadjust > (223 + newlineoverflow) && mouse_yadjust < (256 + newlineoverflow))
            roomnameedit = -2
        else if (mouse_yadjust > (287 + newlineoverflow) && mouse_yadjust < (320 + newlineoverflow))
            roomnameedit = -3
    }
    else if (mouse_check_button_pressed(mb_right) && open == 2 && mouse_xadjust < guiwidth && mouse_yadjust > 31)
    {
        if (mouse_yadjust > 63 && mouse_yadjust < 96)
        {
            dialog = 7
            property = ""
            oldx = 0
        }
        else if (mouse_yadjust > 127 && mouse_yadjust < 160)
        {
            dialog = 7
            property = ""
            oldx = 1
        }
    }
    if (mouse_check_button_pressed(mb_left) && open == 3 && mouse_xadjust < guiwidth && mouse_yadjust > 31)
    {
        if (mouse_yadjust < (((array_length(rooms) * 32) + 32) - objscroll))
        {
            if choosehome
            {
                home = floor((((mouse_yadjust + objscroll) - 32) / 32))
                choosehome = 0
                save = 0
            }
            else
            {
                if (mouse_xadjust > 351)
                {
                    roomnameedit = floor((((mouse_yadjust + objscroll) - 32) / 32))
                    dialog = 6
                    backto = 2
                }
                else
                    curroom = floor((((mouse_yadjust + objscroll) - 32) / 32))
                choosehome = 0
            }
        }
        else if (mouse_yadjust < (((array_length(rooms) * 32) + 64) - objscroll))
        {
            array_push(rooms, "")
            array_push(roomobjects, [])
            array_push(roomtiles, [[], [], [], [], []])
            array_push(layerprop, [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]])
            array_push(tilesetwidth, [13, 13, 13, 13, 13])
            array_push(tilesetheight, [11, 11, 11, 11, 11])
            array_push(levelwidth, 1376)
            array_push(levelheight, 768)
            array_push(bg, -1)
            array_push(mu, -1)
            curroom = (array_length(rooms) - 1)
            roomnameedit = curroom
            choosehome = 0
            save = 0
        }
        else if (mouse_yadjust < (((array_length(rooms) * 32) + 96) - objscroll))
            choosehome = 1
        else
            choosehome = 0
    }
    if (mouse_check_button_pressed(mb_right) && open == 3 && mouse_xadjust < guiwidth && mouse_yadjust > 31)
    {
        if (mouse_yadjust < (((array_length(rooms) * 32) + 32) - objscroll))
        {
            roomnameedit = floor((((mouse_yadjust + objscroll) - 32) / 32))
            choosehome = 0
        }
    }
    if (mouse_check_button_pressed(mb_left) && mouse_xadjust >= guiwidth && mouse_xadjust < (guiwidth + 64) && mouse_yadjust >= 0 && mouse_yadjust < 64)
    {
        playtest = 1
        if player
        {
            if (mu[curroom] > -1)
                audio_stop_sound(player)
            player = undefined
            audio_resume_all()
        }
        curroom = home
        global.coop = spawn[4]
        room_set_width(rm_playtest, levelwidth[curroom])
        room_set_height(rm_playtest, levelheight[curroom])
        room_goto(rm_playtest)
    }
    if (mouse_check_button_pressed(mb_left) && mouse_xadjust >= (guiwidth + 64) && mouse_xadjust < (guiwidth + 128) && mouse_yadjust >= 0 && mouse_yadjust < 64)
    {
        dialog = 2
        if (levelname != "")
            save = 1
        else
            save = 0
    }
    if (levelname != "" && mouse_check_button_pressed(mb_left) && mouse_xadjust >= (guiwidth + 128) && mouse_xadjust < (guiwidth + 192) && mouse_yadjust >= 0 && mouse_yadjust < 64)
    {
        dialog = 2
        save = 0
    }
    if (open == 0 && mouse_xadjust < guiwidth)
        objscroll = median(0, (objscroll + ((mouse_wheel_down() - mouse_wheel_up()) * 32)), max(((ceil(((array_length(folders[curfolder]) / 2) - 0.5)) * 128) - 1048), 0))
    else if (open == 3 && mouse_xadjust < guiwidth)
        objscroll = median(0, (objscroll + ((mouse_wheel_down() - mouse_wheel_up()) * 32)), max(((array_length(rooms) * 32) - 992), 0))
    if (mouse_check_button_pressed(mb_left) && mouse_xadjust < guiwidth)
    {
        if (open == -1)
        {
            if (mouse_yadjust < 32)
            {
                open = 0
                guiwidth = 256
            }
            else if (mouse_yadjust < 64)
            {
                open = 1
                guiwidth = 416
            }
            else if (mouse_yadjust < 96)
            {
                open = 2
                guiwidth = 256
            }
            else if (mouse_yadjust < 128)
            {
                open = 3
                guiwidth = 384
            }
        }
        else if (mouse_yadjust < 32)
        {
            open = -1
            guiwidth = 256
            roomnameedit = -1
            choosehome = 0
            objscroll = 0
            if player
            {
                if (mu[curroom] > -1)
                    audio_stop_sound(player)
                player = undefined
                audio_resume_all()
            }
        }
    }
}
else if (!dialog)
{
    if ((!global.mute) && (!global.useshoptheme) && audio_is_playing(mus_shop) && mu[curroom] != 2)
    {
        audio_stop_sound(mus_shop)
        if player
            audio_resume_sound(player)
        else
            audio_resume_all()
    }
}
if (dialog == 1)
{
    if mouse_check_button_pressed(mb_left)
    {
        if (mouse_xadjust > 639 && mouse_xadjust < 960 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            dialog = 2
            if (levelname != "")
                save = 1
            else
                save = 0
        }
        else if (mouse_xadjust > 959 && mouse_xadjust < 1280 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            dialog = 0
            save = 1
        }
        else if (mouse_xadjust < 256 && mouse_yadjust < 32)
        {
            dialog = 0
            backto = 0
        }
    }
}
if (dialog == 2)
{
    if (!save)
    {
        levelname += keyboard_string
        if keyboard_check_pressed(vk_backspace)
        {
            levelname = string_delete(levelname, string_length(levelname), 1)
            keyboard_key_release(vk_backspace)
        }
        if (mouse_check_button_pressed(mb_left) && mouse_xadjust < 256 && mouse_yadjust < 32)
        {
            levelname = oldlevelname
            dialog = 0
            backto = 0
            nameempty = 0
        }
        if keyboard_check_pressed(vk_return)
        {
            if (levelname == "")
                nameempty = 1
            else
            {
                nameempty = 0
                if file_exists((("levels/" + levelname) + ".json"))
                    dialog = 4
                else
                    save = 1
            }
        }
    }
    else
    {
        oldlevelname = levelname
        show_message((("Saving level as " + levelname) + ".json..."))
        dialog = 0
        var contents = 
        {
            objects: roomobjects,
            tiles: roomtiles,
            lyrprop: layerprop,
            lvlname: levelname,
            lvlwidth: levelwidth,
            lvlheight: levelheight,
            spwn: spawn,
            bg: bg,
            mu: mu,
            rms: rooms,
            hme: home,
            point: global.custompoints,
            baddies: global.customkilledbaddies,
            bgnme: bgname,
            munme: muname,
            v: version
        }

        var jsonString = json_stringify(contents, 0)
        var jsonbuff = buffer_create(1, buffer_grow, 1)
        buffer_write(jsonbuff, buffer_string, jsonString)
        buffer_save(jsonbuff, (("levels/" + levelname) + ".json"))
        buffer_delete(jsonbuff)
    }
}
if (dialog == 3)
{
    if (keyboard_check_pressed(vk_up) || gamepad_axis_value(0, gp_axislv) < 0)
    {
        selected -= 1
        if (selected < 0)
            selected = (array_length(levels) + 1)
    }
    if (keyboard_check_pressed(vk_down) || gamepad_axis_value(0, gp_axislv) > 0)
    {
        selected += 1
        if (selected > (array_length(levels) + 1))
            selected = 0
    }
    if (keyboard_check_pressed(global.key_punch) || gamepad_button_check_pressed(0, gp_face1))
    {
        if (selected == 0)
        {
            persistent = 0
            room_goto(Titlescreen)
        }
        else if (selected == 1)
        {
            selected = -1
            edge = -1
            dialog = 0
        }
        else
            dialog += 0.5
    }
    if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start))
    {
        persistent = 0
        room_goto(Titlescreen)
    }
}
else if (dialog == 3.5)
{
    if (keyboard_check_pressed(vk_left) || gamepad_axis_value(0, gp_axislh) < 0)
    {
        edge -= 1
        if (edge < 0)
            edge = 3
    }
    if (keyboard_check_pressed(vk_right) || gamepad_axis_value(0, gp_axislh) > 0)
    {
        edge += 1
        if (edge > 3)
            edge = 0
    }
    if (keyboard_check_pressed(global.key_punch) || gamepad_button_check_pressed(0, gp_face1))
    {
        if (edge == 3)
            dialog = 6
        else
        {
            var readbuff = buffer_load((("levels/" + levels[(selected - 2)]) + ".json"))
            var jsonStruct = json_parse(buffer_read(readbuff, buffer_string))
            buffer_delete(readbuff)
            levelname = jsonStruct.lvlname
            levelwidth = jsonStruct.lvlwidth
            levelheight = jsonStruct.lvlheight
            roomtiles = jsonStruct.tiles
            layerprop = jsonStruct.lyrprop
            roomobjects = jsonStruct.objects
            spawn = jsonStruct.spwn
            bg = jsonStruct.bg
            mu = jsonStruct.mu
            rooms = jsonStruct.rms
            home = jsonStruct.hme
            global.custompoints = jsonStruct.point
            global.customkilledbaddies = jsonStruct.baddies
            bgname = jsonStruct.bgnme
            muname = jsonStruct.munme
            extrabg = []
            extramu = []
            for (i = 0; i < array_length(bgname); i++)
            {
                var bgtest = scr_asset_get_index(bgname[i], 1)
                if bgtest
                    array_push(extrabg, bgtest)
                else
                {
                    var yea = (array_length(bgs) + i)
                    for (var j = 0; j < array_length(rooms); j++)
                    {
                        if (bg[j] == yea)
                            bg[j] = -1
                    }
                    show_message(("Failed to load background " + bgname[i]))
                    array_delete(bgname, i, 1)
                    i--
                }
            }
            for (i = 0; i < array_length(muname); i++)
            {
                bgtest = scr_asset_get_index(muname[i], 2)
                if bgtest
                    array_push(extramu, bgtest)
                else
                {
                    yea = (array_length(mus) + i)
                    for (j = 0; j < array_length(rooms); j++)
                    {
                        if (mu[j] == yea)
                            mu[j] = -1
                    }
                    show_message(("Failed to load song " + muname[i]))
                    array_delete(muname, i, 1)
                    i--
                }
            }
            version = jsonStruct.v
            curroom = home
            oldlevelname = levelname
            global.leveltosave = (levelname + "_editor")
            dialog = 0
            selected = -1
            if (edge == 0 || edge == 1)
            {
                if gamepad_button_check_pressed(0, gp_face1)
                    global.pausedisable = 1
                else if keyboard_check_pressed(global.key_punch)
                    keyboard_key_release(global.key_punch)
                global.coop = edge == 1
                playtest = 2
                edge = -1
                room_set_width(rm_playtest, levelwidth[curroom])
                room_set_height(rm_playtest, levelheight[curroom])
                room_goto(rm_playtest)
            }
            else
            {
                for (i = 0; i < array_length(rooms); i++)
                {
                    for (j = 0; j < 5; j++)
                    {
                        tilesetwidth[i][j] = (sprite_get_width(tilesets[layerprop[i][j][0]][1]) / 32)
                        tilesetheight[i][j] = (sprite_get_height(tilesets[layerprop[i][j][0]][1]) / 32)
                    }
                }
            }
            edge = -1
        }
    }
    if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start))
        dialog -= 0.5
}
if (dialog == 4)
{
    if mouse_check_button_pressed(mb_left)
    {
        if (mouse_xadjust > 639 && mouse_xadjust < 960 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            dialog = 2
            save = 1
        }
        else if (mouse_xadjust > 959 && mouse_xadjust < 1280 && mouse_yadjust > 599 && mouse_yadjust < 720)
            dialog = 2
    }
}
if (dialog == 5)
{
    if mouse_check_button_pressed(mb_left)
    {
        if (mouse_xadjust > 639 && mouse_xadjust < 960 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            roomtiles[curroom][curlayer] = []
            if (!oldx)
            {
                layerprop[curroom][curlayer][0] -= 1
                if (layerprop[curroom][curlayer][0] < 0)
                    layerprop[curroom][curlayer][0] = (array_length(tilesets) - 1)
            }
            else
            {
                layerprop[curroom][curlayer][0] += 1
                if (layerprop[curroom][curlayer][0] > (array_length(tilesets) - 1))
                    layerprop[curroom][curlayer][0] = 0
            }
            oldx = 0
            tilesetwidth[curroom][curlayer] = (sprite_get_width(tilesets[layerprop[curroom][curlayer][0]][1]) / 32)
            tilesetheight[curroom][curlayer] = (sprite_get_height(tilesets[layerprop[curroom][curlayer][0]][1]) / 32)
            dialog = 0
            save = 0
            tiledx1 = -1
            tiledy1 = -1
            tiledx2 = -1
            tiledy2 = -1
        }
        else if (mouse_xadjust > 959 && mouse_xadjust < 1280 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            dialog = 0
            oldx = 0
        }
    }
}
if (dialog == 6)
{
    if mouse_check_button_pressed(mb_left)
    {
        var autono = 0
        if (mouse_xadjust > 639 && mouse_xadjust < 960 && mouse_yadjust > 599 && mouse_yadjust < 720)
        {
            if (backto == 2 && array_length(rooms) < 2)
                autono = 1
            else if (backto == 2)
            {
                array_delete(rooms, roomnameedit, 1)
                array_delete(roomobjects, roomnameedit, 1)
                array_delete(roomtiles, roomnameedit, 1)
                array_delete(layerprop, roomnameedit, 1)
                array_delete(tilesetwidth, roomnameedit, 1)
                array_delete(tilesetheight, roomnameedit, 1)
                array_delete(levelwidth, roomnameedit, 1)
                array_delete(levelheight, roomnameedit, 1)
                array_delete(bg, roomnameedit, 1)
                array_delete(mu, roomnameedit, 1)
                if (home == roomnameedit)
                    home = 0
                curroom = 0
                dialog = 0
                backto = 0
                save = 0
                roomnameedit = -1
            }
            else
            {
                var success = file_delete((("levels/" + levels[(selected - 2)]) + ".json"))
                if success
                    show_debug_message("Level deletion successful")
                else
                    show_debug_message("Level deletion failed")
                ini_open("savedata.ini")
                ini_section_delete((levels[(selected - 2)] + "_editor"))
                ini_close()
                array_delete(levels, (selected - 2), 1)
                selected = 0
                dialog = 3
            }
        }
        if (autono || (mouse_xadjust > 959 && mouse_xadjust < 1280 && mouse_yadjust > 599 && mouse_yadjust < 720))
        {
            dialog = 0
            if (backto == 2)
                roomnameedit = -1
            else
                dialog = 3.5
            backto = 0
        }
    }
}
if (dialog == 7)
{
    property += keyboard_string
    if keyboard_check_pressed(vk_backspace)
    {
        property = string_delete(property, string_length(property), 1)
        keyboard_key_release(vk_backspace)
    }
    if (mouse_check_button_pressed(mb_left) && mouse_xadjust < 256 && mouse_yadjust < 32)
    {
        property = -1
        oldx = 0
        dialog = 0
        backto = 0
        nameempty = 0
    }
    if keyboard_check_pressed(vk_return)
    {
        if (property == "")
            nameempty = 1
        else if oldx
        {
            found = -1
            i = 0
            while (i < array_length(muname))
            {
                if (muname[i] == property)
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
                mu[curroom] = (array_length(mus) + found)
                property = -1
                oldx = 0
                dialog = 0
                backto = 0
                nameempty = 0
                save = 0
            }
            else
            {
                var propasset = scr_asset_get_index(property, 2)
                if (!propasset)
                    nameempty = 1
                else
                {
                    array_push(extramu, propasset)
                    array_push(muname, property)
                    mu[curroom] = ((array_length(extramu) + array_length(mus)) - 1)
                    property = -1
                    oldx = 0
                    dialog = 0
                    backto = 0
                    nameempty = 0
                    save = 0
                }
            }
        }
        else
        {
            found = -1
            i = 0
            while (i < array_length(bgname))
            {
                if (bgname[i] == property)
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
                bg[curroom] = (array_length(bgs) + found)
                property = -1
                oldx = 0
                dialog = 0
                backto = 0
                nameempty = 0
                save = 0
            }
            else
            {
                propasset = scr_asset_get_index(property, 1)
                if (!propasset)
                    nameempty = 1
                else
                {
                    array_push(extrabg, propasset)
                    array_push(bgname, property)
                    bg[curroom] = ((array_length(extrabg) + array_length(bgs)) - 1)
                    property = -1
                    oldx = 0
                    dialog = 0
                    backto = 0
                    nameempty = 0
                    save = 0
                }
            }
        }
    }
}
keyboard_string = ""
