if (target_door == "")
    target_door = "A"
var door = asset_get_index(("obj_door" + string_upper(target_door)))
if (door != self && instance_exists(door))
{
    x = door.x
    y = door.y
}
else if instance_exists(obj_doorA)
{
    x = obj_doorA.x
    y = obj_doorA.y
}
else if instance_exists(obj_doors)
{
    x = obj_doors.x
    y = obj_doors.y
}
else
{
    x = 0
    y = 0
}
obj_camera.x = x
obj_camera.y = y
target_door = "A"
