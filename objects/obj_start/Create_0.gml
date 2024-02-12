var error;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_sprite_add_gif

System.InvalidOperationException: Sequence contains no matching element
   at System.Linq.ThrowHelper.ThrowNoMatchException()
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source, Func`2 predicate)
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2512
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2776
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2549
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_sprite_add_gif_buffer

System.InvalidOperationException: Sequence contains no matching element
   at System.Linq.ThrowHelper.ThrowNoMatchException()
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source, Func`2 predicate)
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2512
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2776
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2549
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_gif_std_gml_internal_ArrayImpl_push

System.InvalidOperationException: Sequence contains no matching element
   at System.Linq.ThrowHelper.ThrowNoMatchException()
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source, Func`2 predicate)
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2512
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2776
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2549
*/
startgame = 0
if (!variable_global_exists("actualstartgame"))
{
    global.actualstartgame = 1
    global.sprites = []
    global.sounds = []
    var findsprites = []
    for (var _file = file_find_first("assets/*.png", 0); _file != ""; _file = file_find_next())
        array_push(findsprites, _file)
    show_debug_message((("Found " + string(array_length(findsprites))) + " files."))
    file_find_close()
    for (var i = 0; i < array_length(findsprites); i++)
    {
        ini_open((("assets/" + string_replace(findsprites[i], ".png", "")) + ".ini"))
        array_push(global.sprites, [sprite_add(("assets/" + findsprites[i]), ini_read_real("PROP", "imgnumber", 1), false, false, ini_read_real("PROP", "xorig", 0), ini_read_real("PROP", "yorig", 0)), string_replace(findsprites[i], ".png", "")])
        sprite_set_speed(global.sprites[i][0], 1, 1)
        ini_close()
    }
    findsprites = []
    for (_file = file_find_first("assets/*.gif", 0); _file != ""; _file = file_find_next())
        array_push(findsprites, _file)
    show_debug_message((("Found " + string(array_length(findsprites))) + " files."))
    file_find_close()
    for (i = 0; i < array_length(findsprites); i++)
    {
        ini_open((("assets/" + string_replace(findsprites[i], ".gif", "")) + ".ini"))
        try_hook(1424, 1540)
        array_push(global.sprites, [gml_Script_sprite_add_gif(("assets/" + findsprites[i]), ini_read_real("PROP", "xorig", 0), ini_read_real("PROP", "yorig", 0)), string_replace(findsprites[i], ".gif", "")])
        sprite_set_speed(global.sprites[i][0], 1, 1)
        try_unhook()
        ini_close()
    }
    findsprites = []
    for (_file = file_find_first("assets/*.ogg", 0); _file != ""; _file = file_find_next())
        array_push(findsprites, _file)
    show_debug_message((("Found " + string(array_length(findsprites))) + " files."))
    file_find_close()
    for (i = 0; i < array_length(findsprites); i++)
    {
        array_push(global.sounds, [audio_create_stream(("assets/" + findsprites[i])), string_replace(findsprites[i], ".ogg", "")])
        audio_sound_gain(global.sounds[i][0], 1, 0)
    }
}
image_speed = 0.2
ini_open("savedata.ini")
global.level1unlock = ini_read_real("levelunlocks", "levelone", 0)
global.challengemodeunlock = ini_read_string("pizzadungeon", "beaten", "false")
ini_close()
ini_open("settings.ini")
window_set_fullscreen(ini_read_string("Controls", "fullscreen", 0) == "1")
ini_close()
global.panic = 0
global.useshoptheme = 0
global.shopoverride = 0
global.points = 0
global.saveroom = ds_list_create()
global.leveltosave = "hub1"
global.mute = 0
global.controllerinputcooldown = 10
scr_initinput()
