if active
{
    draw_textbox()
    if (currentChar < string_length(text))
    {
        if ((room_speed % delay) == 0)
            currentChar++
    }
    set_text(global.font, 255, 0)
    draw_text(256, 100, string_copy(text, 1, currentChar))
}
