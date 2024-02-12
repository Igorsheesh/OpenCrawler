scr_getinput()
switch facedirection
{
    case (5 << 0):
        spr_idle = spr_chest_idle
        spr_open = spr_chestopen
        break
    case (1 << 0):
        spr_idle = spr_chest_right_idle
        spr_open = spr_chest_right_open
        break
    case (2 << 0):
        spr_idle = spr_chest_up_idle
        spr_open = spr_chest_up_open
        break
    case (0 << 0):
        spr_idle = spr_chest_left_idle
        spr_open = spr_chest_left_open
        break
}

if (sprite_index != spr_open)
    sprite_index = spr_idle
if (sprite_index == spr_open)
{
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 2
        image_speed = 0
    }
}
if (instance_nearest(x, y, obj_player).object_index != obj_player2)
{
    if (obj_player.sprite_index == obj_player.spr_peace && distance_to_object(obj_player) < 20)
    {
        if (gavepoints == 0)
        {
            global.points += 200
            gavepoints = 1
        }
    }
}
else if (obj_player2.sprite_index == obj_player2.spr_peace && distance_to_object(obj_player2) < 20)
{
    if (gavepoints == 0)
    {
        global.points += 200
        gavepoints = 1
    }
}
