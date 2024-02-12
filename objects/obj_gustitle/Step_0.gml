if (sprite_index == spr_gustavo_forward_hurt)
{
    if (floor(image_index) == (image_number - 1))
        sprite_index = spr_gustavo_right
}
if obj_start.startgame
{
    hspeed = 30
    sprite_index = spr_gustavo_right_mach
    if (alarm_get(1) <= 0)
        alarm_set(1, 5)
}
if (hspeed > 0)
    hspeed++
if usepalette
{
    paletteselect = scr_overflow(paletteselect, 1, (sprite_get_width(spr_pal) - 1))
    if ((!palgenerated) || paletteselect != prevpalselect)
    {
        palarray = scr_paltoarr(spr_pal, paletteselect)
        palgenerated = 1
        prevpalselect = paletteselect
    }
}
if (paletteselect == 0)
{
    ini_open("savedata.ini")
    paletteselect = ini_read_real("palette", "currentpalette", 1)
    ini_close()
}
