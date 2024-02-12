if usepalette
{
    paletteselect = scr_overflow(paletteselect, 0, (sprite_get_width(spr_pal) - 1))
    if ((!palgenerated) || paletteselect != prevpalselect)
    {
        palarray = scr_paltoarr(spr_pal, paletteselect)
        palgenerated = 1
        prevpalselect = paletteselect
    }
}
if (vsp < 20)
    vsp += grav
if (buffer > 0)
    buffer--
if (d > 150)
    d -= 20
make_colour_hsv(255, 255, d)
x += hsp
y += floor(vsp)
if (sprite_index == spr_pizzatitle)
{
    hsp++
    vsp++
}
if (sprite_index == spr_crawlertitle)
{
    hsp--
    vsp++
}
