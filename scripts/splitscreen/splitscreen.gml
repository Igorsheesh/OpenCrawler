function CreateCameras() //gml_Script_CreateCameras
{
    if (!force1playercam)
        playerCount = instance_number(obj_player)
    else
        playerCount = 1
    var width = 624
    var height = 351
    var scale = 3.076923076923077
    if (is_undefined(global.Cameras) == 0)
    {
        for (var i = 0; i < array_length(global.Cameras); i++)
            camera_destroy(global.Cameras[i])
    }
    global.Cameras = undefined
    view_visible[0] = false
    view_visible[1] = false
    view_visible[2] = false
    view_visible[3] = false
    for (i = 0; i < playerCount; i++)
    {
        player = instance_find(obj_player, i)
        view_visible[i] = true
        if (global.coop || (room == rm_editor && global.coop))
        {
            global.Cameras[i] = camera_create_view(0, 0, (width / 1.25), (height / 1.25), 0, player, -1, -1, width, height)
            view_set_camera(i, global.Cameras[i])
        }
        else if ((room == rm_editor && (!global.coop)) || force1playercam)
        {
            global.Cameras[i] = camera_create_view(0, 0, width, height, 0, player, -1, -1, width, height)
            view_set_camera(i, global.Cameras[i])
        }
        if (i == 0)
        {
            view_xport[i] = 0
            view_yport[i] = 0
            view_wport[0] = width
            view_hport[0] = height
        }
        if (i == 1)
        {
            view_set_xport(1, (width / 2))
            view_set_yport(1, 0)
            view_set_wport(1, (width / 2))
            view_set_hport(1, height)
            camera_set_view_size(global.Cameras[1], (width / 2), height)
            view_set_xport(0, 0)
            view_set_yport(0, 0)
            view_set_wport(0, (width / 2))
            view_set_hport(0, height)
            camera_set_view_size(global.Cameras[0], (width / 2), height)
        }
        if (i == 2)
        {
            view_set_xport(0, 0)
            view_set_yport(0, 0)
            view_set_wport(0, width)
            view_set_hport(0, (height / 2))
            camera_set_view_size(global.Cameras[0], width, (height / 2))
            view_set_xport(1, 0)
            view_set_yport(1, (height / 2))
            view_set_wport(1, (width / 2))
            view_set_hport(1, (height / 2))
            camera_set_view_size(global.Cameras[1], (width / 2), (height / 2))
            view_set_xport(2, (width / 2))
            view_set_yport(2, (height / 2))
            view_set_wport(2, (width / 2))
            view_set_hport(2, (height / 2))
            camera_set_view_size(global.Cameras[2], (width / 2), (height / 2))
        }
        if (i == 3)
        {
            view_set_xport(0, 0)
            view_set_yport(0, 0)
            view_set_wport(0, width)
            view_set_hport(0, (height / 2))
            camera_set_view_size(global.Cameras[0], (width / 2), (height / 2))
            view_set_xport(1, (width / 2))
            view_set_yport(1, 0)
            view_set_wport(1, (width / 2))
            view_set_hport(1, (height / 2))
            camera_set_view_size(global.Cameras[1], (width / 2), (height / 2))
            view_set_xport(2, 0)
            view_set_yport(2, (height / 2))
            view_set_wport(2, (width / 2))
            view_set_hport(2, (height / 2))
            camera_set_view_size(global.Cameras[2], (width / 2), (height / 2))
            view_set_xport(3, (width / 2))
            view_set_yport(3, (height / 2))
            view_set_wport(3, (width / 2))
            view_set_hport(3, (height / 2))
            camera_set_view_size(global.Cameras[3], (width / 2), (height / 2))
        }
    }
    window_set_size((width * scale), (height * scale))
    surface_resize(application_surface, (width * scale), (height * scale))
}

