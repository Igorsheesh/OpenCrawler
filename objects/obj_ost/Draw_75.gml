draw_set_alpha(1)
draw_set_alpha(0.75)
draw_rectangle_color(192, 32, 1727, 159, c_black, c_black, c_black, c_black, 0)
draw_rectangle_color(192, 896, 1727, 1023, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
set_text(global.font, 16777215, 1)
if audio_is_playing(songs[songplaying])
    draw_text_transformed(960, 95, string_concat("PLAYING: ", currentsong[songplaying]), 1.5, 1.5, 0)
else
    draw_text_transformed(960, 95, "NOTHING IS PLAYING", 1.5, 1.5, 0)
if (songselect <= array_length(currentsong))
    draw_text_transformed(960, 960, currentsong[songselect], 1.5, 1.5, 0)
else
    draw_text_transformed(960, 960, "ERROR", 2, 2, 0)
if (songselect != (array_length(songs) - 1) && songselect != 0 && songselect != 1)
    draw_text(960, 1010, "BY THE NOSE")
if (songselect == 0)
    draw_text(960, 1010, "BY THE NOSE - ORIGINALLY BY DISCHU")
if (songselect == 1)
    draw_text(960, 1010, "BY THE NOSE - ORIGINALLY BY DAYPEECONE")
draw_sprite_ext(spr_right, 0, 1632, 928, 2, 2, 0, c_white, 1)
draw_sprite_ext(spr_left, 0, 224, 928, 2, 2, 0, c_white, 1)
