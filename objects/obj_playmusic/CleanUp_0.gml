if player
    audio_stop_sound(player)
if global.mute
{
    global.mute = 0
    global.shopoverride = 0
    if global.useshoptheme
    {
        audio_stop_sound(mus_shop)
        global.useshoptheme = 0
    }
    with (obj_editor)
    {
        if player
            audio_resume_sound(player)
        else
            audio_resume_all()
    }
}
