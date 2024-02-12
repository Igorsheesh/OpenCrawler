palselect = obj_player.palselect
palselect = scr_overflow(palselect, 1, (sprite_get_width(spr_gustavo_pal) - 1))
if ((!palgenerated) || palselect != prevpalselect)
{
    palarray = scr_paltoarr(spr_gustavo_pal, palselect)
    palgenerated = 1
    prevpalselect = palselect
}
if (distance_to_object(obj_player) < 30)
    drawpalsprite = 1
else
    drawpalsprite = 0
if (!(place_meeting(x, y, obj_player)))
    drawtext = 0
