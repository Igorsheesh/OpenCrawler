if menu
{
    draw_set_alpha(0.5)
    draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(0.75)
    draw_rectangle_color(192, 192, 1727, 895, c_black, c_black, c_black, c_black, 0)
    draw_set_halign(fa_center)
    draw_set_font(global.font)
    draw_set_alpha(1)
    draw_set_color(c_white)
    ini_open("savedata.ini")
    if (ini_read_string("longchallengeleveljustfordemo", "beaten", "false") == 1)
        draw_text(960, 346, string_concat("THE CHALLENGE\nRANK: ", ini_read_string("longchallengeleveljustfordemo", "rank", "UNBEATEN"), "\nPOINTS: ", ini_read_string("longchallengeleveljustfordemo", "points", "0"), "\nKILLEDBADDIES: ", ini_read_string("longchallengeleveljustfordemo", "killedbaddies", "0"), "\nENTER?"))
    else
        draw_text(960, 346, "ARE YOU SURE\nYOU WANT TO ENTER THE CHALLENGE LEVEL?")
    ini_close()
    draw_set_halign(fa_left)
    if (select == 1)
    {
        draw_set_halign(fa_left)
        draw_set_color(c_green)
        draw_text(352, 799, "NO")
    }
    else
    {
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        draw_text(352, 799, "NO")
    }
    if (select == 2)
    {
        draw_set_halign(fa_right)
        draw_set_color(c_green)
        draw_text(1567, 799, "YES")
    }
    else
    {
        draw_set_halign(fa_right)
        draw_set_color(c_white)
        draw_text(1567, 799, "YES")
    }
}
