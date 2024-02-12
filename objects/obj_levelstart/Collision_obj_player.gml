var error;
if ((!instance_exists(obj_levelselect)) && (!disable))
{
    disable = 1
    global.ugggghhhh = [levelname, target_room, target_door]
    try_hook(188, 224)
    global.custompoints = min(9999, real(point))
    try_unhook()
    try_hook(316, 352)
    global.customkilledbaddies = min(99, real(baddie))
    try_unhook()
    with (instance_create(x, y, obj_levelselect))
    {
        editorlevel = other.levelname
        editorroom = other.target_room
        editordoor = other.target_door
    }
}
