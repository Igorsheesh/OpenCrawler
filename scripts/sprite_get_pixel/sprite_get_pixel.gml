function sprite_get_pixel(argument0, argument1, argument2, argument3) //gml_Script_sprite_get_pixel
{
    var surface = surface_create(sprite_get_width(argument0), sprite_get_height(argument0))
    if surface_exists(surface)
    {
        surface_set_target(surface)
        draw_sprite(argument0, argument1, 0, 0)
        surface_reset_target()
        var pixel = surface_getpixel(surface, argument2, argument3)
        var red = (pixel & 255)
        var green = ((pixel >> 8) & 255)
        var blue = ((pixel >> 16) & 255)
        return [red, green, blue];
    }
    return [-1, -1, -1];
}

