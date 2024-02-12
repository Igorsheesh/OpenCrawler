if global.mute
    return;
if ((!instance_exists(obj_pause)) && (!instance_exists(obj_rank)) && room != rm_ost && room != rm_rankroom)
{
    if (!global.panic)
    {
        if ((!global.useshoptheme) || global.shopoverride)
        {
            switch room
            {
                case Room1:
                case 10:
                    play_music(7)
                    music = mus_coldspaghetti
                    break
                case 0:
                    if (global.prevroom != 13)
                    {
                        play_music(14)
                        music = mus_title
                    }
                    break
                case 6:
                    if ((!audio_is_playing(mus_editor)) && (!obj_editor.player))
                    {
                        audio_stop_all()
                        audio_play_sound(mus_editor, 5, true, 0.5)
                    }
                    break
                case 3:
                    play_music(24)
                    music = mus_tutorial
                    break
                case 4:
                    play_music(0)
                    music = mus_hub1
                    break
                case 5:
                    play_music(17)
                    music = mus_level1
                    break
                case 9:
                    play_music(22)
                    music = mus_pizzadungeon
                    break
            }

            if ((!global.useshoptheme) && audio_is_playing(mus_shop))
            {
                audio_stop_sound(mus_shop)
                if music
                    audio_resume_sound(music)
                else
                    audio_resume_all()
            }
        }
        else if (global.useshoptheme && (!global.shopoverride))
            play_music(10)
        else
            audio_resume_sound(music)
    }
    else if global.panic
        play_music(16)
}
else if instance_exists(obj_pause)
{
    if (!audio_is_playing(mus_pause))
        audio_play_sound(mus_pause, 5, true)
}
if instance_exists(obj_rank)
{
    if ((!audio_is_playing(mus_rankidle)) && obj_rank.ranksound == 0)
    {
        audio_stop_all()
        play_music(27)
    }
    else if (audio_is_playing(mus_rankidle) && obj_rank.ranksound != 0)
        audio_stop_sound(mus_rankidle)
    switch obj_rank.rank
    {
        case "B":
        case "C":
            play_sound_unique(3)
            break
        case "D":
            play_sound_unique(29)
            break
        case "S":
            play_sound_unique(23)
            break
        case "A":
            play_sound_unique(2)
            break
    }

}
