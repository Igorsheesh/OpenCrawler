if (other.object_index != obj_player2 && instance_exists(obj_pedestal) && obj_player.state != (5 << 0) && obj_player.state != (2 << 0))
{
    with (other)
    {
        state = (5 << 0)
        var movetoward = point_direction(obj_player.x, obj_player.y, obj_pedestal.x, obj_pedestal.y)
        if (((movetoward + 22.5) % 360) >= 0 && ((movetoward + 22.5) % 360) < 45)
            sprite_index = spr_moveright
        else if (movetoward >= 22.5 && movetoward < 67.5)
            sprite_index = spr_moveupright
        else if (movetoward >= 67.5 && movetoward < 112.5)
            sprite_index = spr_moveup
        else if (movetoward >= 112.5 && movetoward < 157.5)
            sprite_index = spr_moveupleft
        else if (movetoward >= 157.5 && movetoward < 202.5)
            sprite_index = spr_moveleft
        else if (movetoward >= 202.5 && movetoward < 247.5)
            sprite_index = spr_movedownleft
        else if (movetoward >= 247.5 && movetoward < 292.5)
            sprite_index = spr_movedown
        else if (movetoward >= 292.5 && movetoward < 337.5)
            sprite_index = spr_movedownright
    }
}
