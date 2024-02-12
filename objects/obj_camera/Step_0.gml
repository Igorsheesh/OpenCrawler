max_view_x = (room_width - camera_get_view_width(view_camera[0]))
max_view_y = (room_height - camera_get_view_height(view_camera[0]))
if (follow != noone && instance_exists(follow))
{
    xTo = follow.x
    yTo = follow.y
}
x += ((xTo - x) / 5)
y += ((yTo - y) / 5)
camera_set_view_pos(view_camera[0], (x - (camWidth * 0.5)), (y - (camHeight * 0.5)))
var _gridwidth = to_tile(room_width)
var _gridheight = to_tile(room_height)
global.AIgrid = mp_grid_create(0, 0, _gridwidth, _gridheight, 32, 32)
mp_grid_add_instances(global.AIgrid, obj_solid, 0)
if (!createdcameras)
{
    CreateCameras()
    createdcameras = 1
}
global.controllerinputcooldown--
if (follow == 83)
{
    anchor1timer--
    if (anchor1timer <= 0)
    {
        follow = 66
        obj_player.state = (0 << 0)
        if global.coop
            obj_player2.state = (0 << 0)
    }
}
if global.panic
{
    if (fill > 0)
        fill -= 0.2
    if (fill <= 0 && obj_player.hp > 0)
        obj_player.hp -= 0.016666666666666666
}
if (follow != 66 && global.coop)
    follow = 66
if global.panic
    shakevalue = 0.3
