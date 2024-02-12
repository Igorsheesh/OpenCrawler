global.prevroom = 0
global.darkness = 0
var camera = view_get_camera(0)
var cam_width = camera_get_view_width(camera)
var cam_height = camera_get_view_height(camera)
light_surface = surface_create(cam_width, cam_height)
light_surface2 = surface_create(cam_width, cam_height)
