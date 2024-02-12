if (mutebg && (!global.mute))
{
    global.mute = 1
    global.shopoverride = 1
    if global.useshoptheme
        audio_pause_sound(mus_shop)
    else
    {
        with (obj_editor)
        {
            if player
                audio_pause_sound(player)
            else
            {
                audio_pause_all()
                with (obj_playmusic)
                {
                    if player
                        audio_resume_sound(player)
                }
            }
        }
    }
}
if ((!player) && music)
    player = audio_play_sound(music, 3, loop, volume, offset, pitch)
