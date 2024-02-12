if (!global.panic)
    visible = false
else if global.panic
    visible = true
if (!instance_exists(obj_cameraanchor1))
    instance_create(x, y, obj_cameraanchor1)
