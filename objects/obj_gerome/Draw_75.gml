if active
{
    draw_textbox()
    if (currentChar < string_length(text))
    {
        if ((room_speed % delay) == 0)
            currentChar++
    }
    draw_set_font(global.font)
    draw_set_color(c_purple)
    draw_text(256, 100, string_copy(text, 1, currentChar))
}
