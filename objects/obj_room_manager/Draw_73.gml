if (global.darkness && room != Titlescreen)
{
    var camera = view_get_camera(0)
    if (!surface_exists(light_surface))
    {
        var cam_width = camera_get_view_width(camera)
        var cam_height = camera_get_view_height(camera)
        light_surface = surface_create(cam_width, cam_height)
    }
    if global.coop
    {
        var camera2 = view_get_camera(1)
        if (!surface_exists(light_surface2))
        {
            var cam_width2 = camera_get_view_width(camera2)
            var cam_height2 = camera_get_view_height(camera2)
            light_surface2 = surface_create(cam_width2, cam_height2)
        }
    }
    surface_set_target(light_surface)
    draw_clear(c_black)
    camera_apply(camera)
    darkdraw()
    if global.coop
    {
        surface_set_target(light_surface2)
        draw_clear(c_black)
        camera_apply(camera2)
        darkdraw()
    }
    surface_reset_target()
    surface_reset_target()
}
