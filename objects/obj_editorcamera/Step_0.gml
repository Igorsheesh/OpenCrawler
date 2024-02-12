if (obj_editor.dialog == 0)
{
    if (keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) > 0)
        camera_set_view_pos(view_camera[0], (camera_get_view_x(view_camera[0]) + 32), camera_get_view_y(view_camera[0]))
    if (keyboard_check(vk_left) || gamepad_axis_value(0, gp_axislh) < 0)
        camera_set_view_pos(view_camera[0], (camera_get_view_x(view_camera[0]) - 32), camera_get_view_y(view_camera[0]))
    if (keyboard_check(vk_down) || gamepad_axis_value(0, gp_axislv) > 0)
        camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), (camera_get_view_y(view_camera[0]) + 32))
    if (keyboard_check(vk_up) || gamepad_axis_value(0, gp_axislv) < 0)
        camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), (camera_get_view_y(view_camera[0]) - 32))
    if (obj_editor.mouse_xadjust > (obj_editor.guiwidth - 1) && (!scr_lightscroll()))
    {
        zoom_level = clamp((zoom_level + ((mouse_wheel_down() - mouse_wheel_up()) * 0.1)), 0.5, 2)
        var view_w = camera_get_view_width(view_camera[0])
        var view_h = camera_get_view_height(view_camera[0])
        var rate = 0.2
        var new_w = lerp(view_w, (zoom_level * default_zoom_width), rate)
        var new_h = lerp(view_h, (zoom_level * default_zoom_height), rate)
        camera_set_view_size(view_camera[0], new_w, new_h)
        var vpos_x = camera_get_view_x(view_camera[0])
        var vpos_y = camera_get_view_y(view_camera[0])
    }
}
