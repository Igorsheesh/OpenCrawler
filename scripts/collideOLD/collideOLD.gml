function scr_collide() //gml_Script_scr_collide
{
    if place_meeting((x + 1), y, obj_solid)
    {
        movex = 0
        movexright = 1
    }
    else if place_meeting((x - 1), y, obj_solid)
    {
        movex = 1
        movexright = 0
    }
    else
    {
        movex = 1
        movexright = 1
    }
    if place_meeting(x, (y + 1), obj_solid)
    {
        movey = 0
        moveydown = 1
    }
    if place_meeting(x, (y - 1), obj_solid)
    {
        movey = 1
        moveydown = 0
    }
    else
    {
        movey = 1
        moveydown = 1
    }
}

