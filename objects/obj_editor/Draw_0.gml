if ((!playtest) && (!dialog))
{
    if (bg[curroom] >= array_length(bgs))
        draw_sprite_tiled(extrabg[(bg[curroom] - array_length(bgs))], 0, 0, 0)
    else if (bg[curroom] > -1)
        draw_sprite_tiled(bgs[bg[curroom]][0], 0, 0, 0)
    var tileout = (tiledx1 > -1 && (mouse_xadjust > guiwidth || (open == -1 && mouse_yadjust > 127)) && (!tiling))
    for (var layerr = 0; layerr < 5; layerr++)
    {
        if (curlayer != layerr && (open == 1 || tiledx1 > -1))
            draw_set_alpha(0.5)
        var tille = (tileout && curlayer == layerr)
        for (var i = 0; i < array_length(roomtiles[curroom][layerr]); i++)
        {
            var deleted = 0
            if (levelx != 0 || levely != 0)
            {
                roomtiles[curroom][layerr][i][1] -= (levelx / 32)
                roomtiles[curroom][layerr][i][2] -= (levely / 32)
                if (roomtiles[curroom][layerr][i][1] < 0 || roomtiles[curroom][layerr][i][2] < 0)
                    deleted = 1
            }
            if (widthless && roomtiles[curroom][layerr][i][1] > ((levelwidth[curroom] / 32) - 1))
                deleted = 1
            if (heightless && roomtiles[curroom][layerr][i][2] > ((levelheight[curroom] / 32) - 1))
                deleted = 1
            if deleted
            {
                array_delete(roomtiles[curroom][layerr], i, 1)
                i -= 1
            }
            else
            {
                var mousse_x = floor((mouse_x / 32))
                var mousse_y = floor((mouse_y / 32))
                if (tille && roomtiles[curroom][layerr][i][1] >= mousse_x && roomtiles[curroom][layerr][i][1] <= ((mousse_x + tiledx2) - tiledx1) && roomtiles[curroom][layerr][i][2] >= mousse_y && roomtiles[curroom][layerr][i][2] <= ((mousse_y + tiledy2) - tiledy1))
                {
                }
                else
                {
                    var tilex = (roomtiles[curroom][layerr][i][0] % tilesetwidth[curroom][layerr])
                    var tiley = ((roomtiles[curroom][layerr][i][0] - tilex) / tilesetwidth[curroom][layerr])
                    draw_sprite_part(tilesets[layerprop[curroom][layerr][0]][1], 0, (tilex * 32), (tiley * 32), 32, 32, (roomtiles[curroom][layerr][i][1] * 32), (roomtiles[curroom][layerr][i][2] * 32))
                }
            }
        }
        draw_set_alpha(1)
        if tille
            draw_sprite_part(tilesets[layerprop[curroom][curlayer][0]][1], 0, (tiledx1 * 32), (tiledy1 * 32), (((tiledx2 - tiledx1) * 32) + 32), (((tiledy2 - tiledy1) * 32) + 32), (floor((mouse_x / 32)) * 32), (floor((mouse_y / 32)) * 32))
    }
    widthless = 0
    heightless = 0
    if (curroom == home)
    {
        if (levelx != 0 || levely != 0)
        {
            spawn[0] -= levelx
            spawn[1] -= levely
            spawn[2] -= levelx
            spawn[3] -= levely
        }
        draw_sprite(Sprite78, 0, spawn[0], spawn[1])
        if spawn[4]
            draw_sprite(spr_player2spawn, 0, spawn[2], spawn[3])
    }
    for (i = 0; i < array_length(roomobjects[curroom]); i++)
    {
        var instance = roomobjects[curroom][i]
        if (levelx != 0 || levely != 0)
        {
            instance[1] -= levelx
            instance[2] -= levely
        }
        draw_sprite_ext(objects[instance[0]][1], 0, instance[1], instance[2], instance[3], instance[4], instance[5], c_white, 1)
    }
    levelx = 0
    levely = 0
    if (highlight > -1)
    {
        instance = roomobjects[curroom][highlight]
        var spr = objects[instance[0]][1]
        var llx = (instance[1] - (sprite_get_xoffset(spr) * instance[3]))
        var rrx = (llx + (sprite_get_width(spr) * instance[3]))
        var uuy = (instance[2] - (sprite_get_yoffset(spr) * instance[4]))
        var ddy = (uuy + (sprite_get_height(spr) * instance[4]))
        var lx = min(llx, rrx)
        var rx = max(llx, rrx)
        var uy = min(uuy, ddy)
        var dy = max(uuy, ddy)
        draw_rectangle(lx, uy, rx, dy, true)
        draw_set_color(c_gray)
        draw_set_alpha(0.5)
        draw_rectangle(rx, uy, (rx + 384), (uy + 256), false)
        draw_set_color(c_white)
        if ((property - lightscroll) > -1 && (property - lightscroll) < 8)
            draw_rectangle(rx, ((uy + (property * 32)) - (lightscroll * 32)), (rx + 384), (((uy + (property * 32)) + 32) - (lightscroll * 32)), false)
        draw_set_alpha(1)
        var convienient = (uy - 24)
        i = (3 + lightscroll)
        while (i < array_length(objects[instance[0]]) && i < (11 + lightscroll))
        {
            draw_text_transformed((rx + 8), (((uy + (i * 32)) - 88) - (lightscroll * 32)), string_upper(((objects[instance[0]][i] + ":") + instance[(i + 3)])), 0.5, 0.5, 0)
            convienient = (((uy + (i * 32)) - 88) - (lightscroll * 32))
            i++
        }
        convienient += 32
        var lscroll = ((lightscroll + 3) - array_length(objects[instance[0]]))
        var start = ((array_length(objects[instance[0]]) + 3) + (max(0, lscroll) * 2))
        i = start
        while (i < array_length(instance) && i < ((16 + start) + (lscroll * 2)))
        {
            draw_sprite_ext(spr_delete, 0, (rx + 352), (convienient - 8), 0.5, 0.5, 0, c_white, 1)
            draw_text_transformed((rx + 8), convienient, string_upper(((instance[i] + ": ") + instance[(i + 1)])), 0.5, 0.5, 0)
            convienient += 32
            i += 2
        }
        if (lightscroll == max(0, ((((array_length(instance) - 9) + array_length(objects[instance[0]])) / 2) - 7)))
            draw_sprite_ext(spr_new, 0, rx, (convienient - 8), 0.5, 0.5, 0, c_white, 1)
    }
    if (selected > -1)
    {
        if (mouse_xadjust > guiwidth || (open == -1 && mouse_yadjust > 127))
        {
            if keyboard_check(vk_shift)
                draw_sprite(objects[selected][1], 0, mouse_x, mouse_y)
            else
                draw_sprite(objects[selected][1], 0, (floor((mouse_x / 32)) * 32), (floor((mouse_y / 32)) * 32))
        }
    }
    draw_rectangle(0, 0, levelwidth[curroom], levelheight[curroom], true)
}
