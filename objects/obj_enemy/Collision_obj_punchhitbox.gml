if visible
{
    audio_play_sound(sfx_break, 2, false)
    with (other)
    {
        if (object_index == obj_punchhitbox)
        {
            if (obj_player.state == (1 << 0))
                movespeed = 8
        }
        else if (object_index == obj_punchhitboxp2)
        {
            if (obj_player2.state == (1 << 0))
                movespeed = 8
        }
    }
    instance_destroy(self)
}
