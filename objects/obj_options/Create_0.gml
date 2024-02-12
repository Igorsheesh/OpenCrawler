playernum = 0
tilex = 1
tiley = 1
select = 0
if (!instance_exists(obj_pause))
{
    instance_deactivate_all(true)
    instance_activate_object(obj_music)
}
else
    instance_deactivate_object(obj_pause)
scr_getinput()
keys = ["up", "down", "right", "left", "mach", "punch", "interact"]
keyset = 0
ini_open("settings.ini")
vol = ini_read_real("volume", "master", 1)
ini_close()
