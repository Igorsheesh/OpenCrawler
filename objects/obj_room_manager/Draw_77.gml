if (global.darkness && room != Titlescreen)
{
    draw_surface(application_surface, 0, 0)
    draw_set_alpha(0.75)
    if (!global.coop)
        draw_surface_stretched(light_surface, 0, 0, window_get_width(), window_get_height())
    else
    {
        draw_surface_stretched(light_surface, 0, 0, (window_get_width() / 2), window_get_height())
        var coop_x = (window_get_width() / 2)
        draw_surface_stretched(light_surface2, coop_x, 0, coop_x, window_get_height())
    }
    draw_set_alpha(1)
}
