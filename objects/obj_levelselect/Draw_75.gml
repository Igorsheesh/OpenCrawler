if (room == rm_playtest)
{
    draw_sprite_tiled_ext(spr_pause_bg, 0, fakex, fakey, 4, 4, c_white, 1)
    fakex += 0.4
    fakey -= 0.4
}
set_text(global.font, 16777215, 0)
draw_text_transformed(10, 960, "PRESS INTERACT TO START!\nNOTE: THIS IS A DEMO. EXPECT BUGS", 1, 1, 0)
draw_set_halign(fa_center)
if (room == rm_playtest)
    draw_text_transformed(960, 540, string_upper(editorlevel), 2, 2, 0)
else
    draw_text_transformed(960, 540, "PIZZA DUNGEON", 2, 2, 0)
ini_open("savedata.ini")
draw_text_transformed(960, 640, string_concat("POINTS: ", ini_read_string(global.leveltosave, "points", "0"), "\nKILLED BADDIES: ", ini_read_string(global.leveltosave, "killedbaddies", "0"), "\nRANK: ", ini_read_string(global.leveltosave, "rank", "UNBEATEN")), 1, 1, 0)
if (ini_read_real(global.leveltosave, "collect1", 0) == 1)
    draw_sprite_ext(spr_collectable1, 1, 94, 110, 2, 2, 0, c_white, 1)
if (ini_read_real(global.leveltosave, "collect2", 0) == 1)
    draw_sprite_ext(spr_collectable2, 1, 150, 96, 2, 2, 0, c_white, 1)
if (ini_read_real(global.leveltosave, "collect3", 0) == 1)
    draw_sprite_ext(spr_collectable3, 1, 218, 96, 2, 2, 0, c_white, 1)
if (ini_read_real(global.leveltosave, "collect4", 0) == 1)
    draw_sprite_ext(spr_collectable4, 1, 295, 96, 2, 2, 0, c_white, 1)
if (ini_read_real(global.leveltosave, "collect5", 0) == 1)
    draw_sprite_ext(spr_collectable5, 1, 352, 96, 2, 2, 0, c_white, 1)
ini_close()
draw_text_transformed(960, 80, "PIZZA\nCRAWLER\nLEVEL SELECT", 2, 2, 0)
draw_set_halign(fa_left)
