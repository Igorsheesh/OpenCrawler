if ok
{
    with (other)
    {
        if (!audio_is_playing(sfx_energycollect))
            audio_play_sound(sfx_energycollect, 3, false)
        stamina = maxstamina
        with (other)
        {
            ok = 0
            ready = 0
        }
        if (state == (1 << 0))
            movespeed = 7
    }
}
