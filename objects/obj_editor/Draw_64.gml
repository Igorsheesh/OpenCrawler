if ((!playtest) && (!dialog))
{
    draw_sprite(spr_playtest, 0, guiwidth, 0)
    draw_sprite(spr_save, 0, (guiwidth + 64), 0)
    if (levelname != "")
        draw_sprite(spr_saveas, 0, (guiwidth + 128), 0)
    draw_set_font(global.font)
    draw_set_color(c_gray)
    switch open
    {
        case -1:
            draw_rectangle(0, 0, 256, 128, false)
            draw_set_color(c_white)
            draw_text(16, 16, "OBJECTS")
            draw_text(16, 48, "TILES")
            draw_text(16, 80, "OTHER")
            draw_text(16, 112, "ROOMS")
            break
        case 0:
            draw_rectangle(0, 32, 256, 1080, false)
            draw_set_color(c_white)
            var setfolder = -1
            for (var i = 1; i < array_length(folders[curfolder]); i++)
            {
                var index = folders[curfolder][i]
                var drawx = (((i - 1) % 2) * 128)
                var drawy = ((32 + (floor(((i / 2) - 0.5)) * 128)) - objscroll)
                if ((index < 0 || index > 1 || curroom == home) && mouse_yadjust > 32 && mouse_xadjust >= drawx && mouse_xadjust < (drawx + 128) && mouse_yadjust >= drawy && mouse_yadjust < (drawy + 128))
                {
                    draw_set_alpha(0.5)
                    draw_rectangle(drawx, drawy, (drawx + 128), (drawy + 128), false)
                    draw_set_alpha(1)
                    if mouse_check_button_pressed(mb_left)
                    {
                        if (index > -1)
                        {
                            if (selected == index)
                                selected = -1
                            else
                                selected = index
                        }
                        else
                        {
                            setfolder = ((-index) - 1)
                            selected = -1
                            objscroll = 0
                        }
                        highlight = -1
                        tiledx1 = -1
                        tiledy1 = -1
                        tiledx2 = -1
                        tiledy2 = -1
                    }
                }
                if (index > -1 && index < 2 && curroom != home)
                    draw_set_alpha(0.5)
                if (index > -1)
                {
                    var spr = objects[index][1]
                    draw_sprite(spr, 0, (((drawx + 64) + sprite_get_xoffset(spr)) - (sprite_get_width(spr) / 2)), (((drawy + 64) + sprite_get_yoffset(spr)) - (sprite_get_height(spr) / 2)))
                }
                else
                    draw_sprite(spr_folder, 0, (drawx + 32), (drawy + 32))
                var text = (index > -1 ? objects[index][2] : folders[((-index) - 1)][0])
                var scale = min(0.5, (128 / string_width(text)))
                draw_text_transformed((drawx + 16), (drawy + 114), text, scale, scale, 0)
                draw_set_alpha(1)
            }
            if (setfolder > -1)
                curfolder = setfolder
            draw_set_color(c_gray)
            draw_rectangle(0, 0, 256, 32, false)
            draw_set_color(c_white)
            draw_text(16, 16, "OBJECTS")
            break
        case 1:
            draw_rectangle(0, 0, 416, 1080, false)
            draw_set_color(c_white)
            draw_text(16, 16, "TILES")
            draw_set_halign(fa_center)
            draw_text_transformed(216, 40, ("LAYER " + string((curlayer + 1))), 0.5, 0.5, 0)
            draw_sprite(spr_left, 0, 0, 32)
            draw_sprite(spr_right, 0, 384, 32)
            draw_text_transformed(216, 72, tilesets[layerprop[curroom][curlayer][0]][2], 0.5, 0.5, 0)
            draw_sprite(spr_left, 0, 0, 64)
            draw_sprite(spr_right, 0, 384, 64)
            draw_sprite(tilesets[layerprop[curroom][curlayer][0]][1], 0, 0, 96)
            if (tiledx1 > -1)
                draw_rectangle((tiledx1 * 32), (96 + (tiledy1 * 32)), (32 + (tiledx2 * 32)), (128 + (tiledy2 * 32)), true)
            draw_set_halign(fa_left)
            draw_text_transformed(8, (104 + (tilesetheight[curroom][curlayer] * 32)), ("DESTROYABLE " + (layerprop[curroom][curlayer][1] ? "TRUE" : "FALSE")), 0.5, 0.5, 0)
            break
        case 2:
            draw_rectangle(0, 0, 256, 1080, false)
            draw_set_color(c_white)
            draw_text(16, 16, "OTHER")
            draw_text_transformed(8, 40, "BACKGROUND", 0.5, 0.5, 0)
            draw_text_transformed(8, 104, "MUSIC", 0.5, 0.5, 0)
            var newlineoverflow = ((mu[curroom] == -1 || mu[curroom] >= array_length(mus)) ? 0 : max(0, ((string_height(mus[mu[curroom]][1]) / 2) - 32)))
            draw_text_transformed(8, (200 + newlineoverflow), "S RANK SCORE", 0.5, 0.5, 0)
            draw_text_transformed(8, (264 + newlineoverflow), "S RANK ENEMY", 0.5, 0.5, 0)
            draw_set_halign(fa_center)
            if (bg[curroom] >= array_length(bgs))
                draw_text_transformed(136, 72, "CUSTOM", 0.5, 0.5, 0)
            else if (bg[curroom] == -1)
                draw_text_transformed(136, 72, "NONE", 0.5, 0.5, 0)
            else
                draw_text_transformed(136, 72, bgs[bg[curroom]][1], 0.5, 0.5, 0)
            draw_sprite(spr_left, 0, 0, 64)
            draw_sprite(spr_right, 0, 224, 64)
            if (mu[curroom] >= array_length(mus))
                draw_text_transformed(136, 136, "CUSTOM", 0.5, 0.5, 0)
            else if (mu[curroom] == -1)
                draw_text_transformed(136, 136, "NONE", 0.5, 0.5, 0)
            else
                draw_text_transformed(136, 136, mus[mu[curroom]][1], 0.5, 0.5, 0)
            draw_sprite(spr_left, 0, 0, 128)
            draw_sprite(spr_right, 0, 224, 128)
            if player
                draw_sprite(spr_stop, 0, 112, (160 + newlineoverflow))
            else
                draw_sprite(spr_play, 0, 112, (160 + newlineoverflow))
            draw_text_transformed(136, (232 + newlineoverflow), global.custompoints, 0.5, 0.5, 0)
            draw_text_transformed(136, (296 + newlineoverflow), global.customkilledbaddies, 0.5, 0.5, 0)
            if (roomnameedit < -1)
            {
                draw_set_alpha(0.5)
                draw_rectangle(0, ((96 + (roomnameedit * -64)) + newlineoverflow), 256, ((128 + (roomnameedit * -64)) + newlineoverflow), false)
                draw_set_alpha(1)
            }
            draw_set_halign(fa_left)
            break
        case 3:
            draw_rectangle(0, 32, 384, 1080, false)
            draw_set_color(c_white)
            for (i = 0; i < array_length(rooms); i++)
            {
                if (curroom == i)
                    draw_set_color(c_yellow)
                draw_text_transformed(8, ((40 + (i * 32)) - objscroll), string_upper(rooms[i]), 0.5, 0.5, 0)
                draw_set_color(c_white)
                if (home == i)
                    draw_sprite(spr_home, 0, (string_width(string_upper(rooms[i])) / 2), ((32 + (i * 32)) - objscroll))
                draw_sprite_ext(spr_delete, 0, 352, ((32 + (i * 32)) - objscroll), 0.5, 0.5, 0, c_white, 1)
            }
            draw_sprite_ext(spr_new, 0, 176, ((32 + (array_length(rooms) * 32)) - objscroll), 0.5, 0.5, 0, c_white, 1)
            if choosehome
                draw_text_transformed(8, ((72 + (array_length(rooms) * 32)) - objscroll), "CHOOSE HOME", 0.5, 0.5, 0)
            else
                draw_text_transformed(8, ((72 + (array_length(rooms) * 32)) - objscroll), "CHANGE HOME", 0.5, 0.5, 0)
            if (roomnameedit > -1)
            {
                draw_set_alpha(0.5)
                draw_rectangle(0, (((roomnameedit * 32) + 32) - objscroll), 384, (((roomnameedit * 32) + 64) - objscroll), false)
                draw_set_alpha(1)
            }
            draw_set_color(c_gray)
            draw_rectangle(0, 0, 384, 32, false)
            draw_set_color(c_white)
            draw_text(16, 16, "ROOMS")
            break
    }

    if (selected > -1)
    {
        if (mouse_xadjust <= guiwidth && (open > -1 || mouse_yadjust < 128))
            draw_sprite(objects[selected][1], 0, mouse_xadjust, mouse_yadjust)
    }
}
if (dialog == 1)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_rectangle(0, 0, 256, 32, false)
    draw_set_color(c_white)
    draw_text(656, 376, "UNSAVED CHANGES\nSAVE?")
    draw_text(656, 616, "YES")
    draw_text(976, 616, "NO")
    draw_rectangle(640, 600, 960, 720, true)
    draw_rectangle(960, 600, 1280, 720, true)
    draw_text(16, 16, "BACK")
}
if (dialog == 2)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_rectangle(0, 0, 256, 32, false)
    draw_set_color(c_white)
    draw_text(656, 376, "LEVEL NAME:")
    draw_text(656, 616, string_upper(levelname))
    if nameempty
        draw_text(976, 616, "REQUIRED")
    draw_text(16, 16, "BACK")
}
if (dialog == 3 || dialog == 3.5)
{
    drawy = ((-selected) * 32)
    if (selected == 0)
        draw_set_color(c_yellow)
    draw_text(656, (376 + drawy), "BACK")
    draw_set_color(c_white)
    if (selected == 1)
        draw_set_color(c_yellow)
    draw_text(656, (408 + drawy), "NEW")
    draw_set_color(c_white)
    for (i = 0; i < array_length(levels); i++)
    {
        if (selected == (i + 2))
            draw_set_color(c_yellow)
        draw_text(656, ((440 + (32 * i)) + drawy), string_upper(levels[i]))
        draw_set_color(c_white)
    }
    if (dialog == 3.5)
    {
        draw_sprite(spr_playtest1, 0, 1280, 360)
        draw_sprite(spr_playtest2, 0, 1344, 360)
        draw_sprite(spr_edit, 0, 1408, 360)
        draw_sprite(spr_delete, 0, 1472, 360)
        draw_rectangle((1280 + (edge * 64)), 360, (1344 + (edge * 64)), 424, true)
    }
    if (selected > 1)
    {
        ini_open("savedata.ini")
        if (ini_read_string((levels[(selected - 2)] + "_editor"), "beaten", "false") == "true")
        {
            var lvl = (levels[(selected - 2)] + "_editor")
            draw_set_halign(fa_right)
            draw_set_valign(fa_bottom)
            draw_text(1920, 1080, string_concat("POINTS: ", ini_read_string(lvl, "points", "0"), "\nKILLED BADDIES: ", ini_read_string(lvl, "killedbaddies", "0"), "\nRANK: ", ini_read_string(lvl, "rank", "0")))
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
        }
        ini_close()
    }
}
if (dialog == 4)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_set_color(c_white)
    draw_text(656, 376, "LEVEL WITH NAME\nALREADY EXISTS\nOVERWRITE?")
    draw_text(656, 616, "YES")
    draw_text(976, 616, "NO")
    draw_rectangle(640, 600, 960, 720, true)
    draw_rectangle(960, 600, 1280, 720, true)
}
if (dialog == 5)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_set_color(c_white)
    draw_text(656, 376, "TILES PLACED\nIN LAYER ALREADY\nCHANGING TILESET\nWILL REMOVE TILES\nCHANGE TILESET?")
    draw_text(656, 616, "YES")
    draw_text(976, 616, "NO")
    draw_rectangle(640, 600, 960, 720, true)
    draw_rectangle(960, 600, 1280, 720, true)
}
if (dialog == 6)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_set_color(c_white)
    if (backto == 2 && array_length(rooms) < 2)
        draw_text(656, 376, "ONLY ROOM IN LEVEL\nCANT DELETE")
    else if (backto == 2)
        draw_text(656, 376, "DELETE ROOM?")
    else
        draw_text(656, 376, "DELETE LEVEL?")
    if (backto == 2 && array_length(rooms) < 2)
    {
        draw_text(656, 616, "OK")
        draw_rectangle(640, 600, 1280, 720, true)
    }
    else
    {
        draw_text(656, 616, "YES")
        draw_text(976, 616, "NO")
        draw_rectangle(640, 600, 960, 720, true)
        draw_rectangle(960, 600, 1280, 720, true)
    }
}
if (dialog == 7)
{
    draw_set_color(c_gray)
    draw_rectangle(640, 360, 1280, 720, false)
    draw_rectangle(0, 0, 256, 32, false)
    draw_set_color(c_white)
    draw_text(656, 376, "ASSET:")
    draw_text(656, 616, string_upper(property))
    if nameempty
        draw_text(976, 616, "ASSET DOESNT\nEXIST")
    draw_text(16, 16, "BACK")
}
if (!playtest)
{
    if (!mouse_check_button(mb_left))
        draw_sprite(spr_hand_idle, -1, mouse_xadjust, mouse_yadjust)
    else
        draw_sprite(spr_hand_click, -1, mouse_xadjust, mouse_yadjust)
}
