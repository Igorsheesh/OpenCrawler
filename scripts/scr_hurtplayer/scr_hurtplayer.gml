function hurtplayer() //gml_Script_hurtplayer
{
    if (object_index != obj_player && object_index != obj_player2)
    {
        if (other.state != (4 << 0) && (!other.invincibility) && other.state != (2 << 0))
        {
            other.iframes = 180
            other.invincibility = 1
            other.state = (4 << 0)
        }
    }
    else if (state != (4 << 0) && (!invincibility) && state != (2 << 0))
    {
        iframes = 180
        invincibility = 1
        state = (4 << 0)
    }
}

