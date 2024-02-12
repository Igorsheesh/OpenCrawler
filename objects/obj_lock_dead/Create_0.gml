if instance_exists(obj_player)
{
    vsp = (sign((y - obj_player.y)) * random_range(-5, -8))
    hsp = (sign((x - obj_player.x)) * random_range(5, 8))
}
else
{
    vsp = 6
    hsp = 1
}
grav = 0.4
angle = 0
spinspeed = choose(0, 0, 0, 10, 20)
alarm[0] = 5
cigar = 0
stomped = 0
oldpalettetexture = -4
buffer = 10
if instance_exists(obj_player)
{
    if (x != obj_player.x)
        image_xscale = (-(sign((x - obj_player.x))))
}
depth = -999
gui = 0
usepalette = 0
paletteselect = 0
palarray = []
spr_pal = 7
palgenerated = 0
palselect = 0
prevpalselect = 0
d = 255
