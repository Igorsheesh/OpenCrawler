if (instance_number(object_index) > 1)
    instance_destroy()
draw_set_font(global.font)
draw_set_color(c_white)
draw_set_halign(fa_left)
if (!variable_global_exists("key_punch"))
    scr_initinput()
roomobjects = [[]]
roomtiles = [[[], [], [], [], []]]
layerprop = [[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]]
curlayer = 0
levelname = ""
oldlevelname = ""
nameempty = 0
objects = [[55, 65, "SPAWN"], [55, 275, "SPAWN2"], [28, 1, "SOLID"], [81, 270, "PANIC\nSOLID"], [60, 308, "UNPANIC\nSOLID"], [57, 54, "BRICK\nSPAWNER"], [14, 11, "PANIC\nSTART"], [89, 123, "PEDESTAL", "fill", "spr"], [82, 343, "DARKNESS"], [2, 0, "METAL\nBLOCK", "hp", "destroytiles"], [64, 2, "BIG METAL\nBLOCK", "hp", "destroytiles"], [19, 252, "CRATE", "destroytiles"], [18, 100, "HALLWAY", "target_room", "target_door"], [75, 212, "DOORA"], [4, 69, "DOOR", "locked"], [11, 66, "KEY"], [52, 329, "SIGN", "text"], [8, 28, "CHEESE\nSLIME", "escape"], [37, 67, "MRSOCK", "escape"], [23, 93, "CUTOUT"], [46, 283, "CHEST", "collectablenum"], [87, 202, "MRSTICK\nSHOP", "idlespr", "talkspr", "text", "panictext"], [39, 22, "SHOP\nAREA"], [77, 118, "NPC", "idleleft", "idleright", "idledown", "idleup", "walkleft", "walkright", "walkdown", "walkup", "dead", "canpunch"], [74, 3, "DOORB"], [3, 277, "DOORC"], [65, 217, "DOORD"], [70, 33, "DOORE"], [40, 313, "DOORF"], [61, 198, "DOORG"], [85, 1, "NPC\nSOLID"], [6, 312, "IMAGE", "normalspr", "panicspr", "imgspeed", "depth"], [47, 182, "MUSIC", "music", "mutebg", "loop", "volume", "offset", "pitch"], [15, 100, "LEVEL\nSTART", "target_room", "target_door", "levelname", "point", "baddie"], [83, 130, "EXITHOLE"], [9, 330, "ENERGY\nBOOSTER"]]
folders = [["BACK", 0, 1, -3, -4, 11, 12, -2, 14, 15, 16, 17, 18, 19, 20, 33, 22, 35, -5, -6], ["DOORS", -1, 13, 24, 25, 26, 27, 28, 29], ["COLLISION", -1, 2, 3, 4, 8, 9, 10], ["PANIC", -1, 3, 4, 5, 6, 7, 34], ["NPC", -1, 21, 23, 30], ["ASSETS", -1, 31, 32]]
curfolder = 0
spawn = [0, 0, 0, 0, 0]
selected = 0
tilesets = [[7, 201, "DUNGEON"], [5, 310, "HUB"], [9, 216, "TUTORIAL"], [8, 189, "SHOP"], [3, 150, "SHOP COUNTER"], [4, 298, "BETA TILES"]]
tiledx1 = -1
tiledy1 = -1
tiledx2 = -1
tiledy2 = -1
oldx = 0
oldy = 0
tiling = 0
tiledrag = 0
tilesetwidth = [[13, 13, 13, 13, 13]]
tilesetheight = [[11, 11, 11, 11, 11]]
highlight = -1
lightscroll = 0
image_speed = 0
playtest = 0
grabx = 0
graby = 0
edge = 0
property = -1
open = -1
guiwidth = 256
dialog = 3
save = 1
levels = []
for (var _file = file_find_first("levels/*.json", 0); _file != ""; _file = file_find_next())
{
    _file = string_replace(_file, ".json", "")
    array_push(levels, _file)
}
show_debug_message((("Found " + string(array_length(levels))) + " files."))
file_find_close()
mouse_xadjust = mouse_x
mouse_yadjust = mouse_y
backto = 0
levelx = 0
levely = 0
levelwidth = [1376]
levelheight = [768]
objscroll = 0
bg = [-1]
bgs = [[281, "DUNGEON"], [228, "HUB"], [20, "TUTORIAL"], [63, "SHOP"], [153, "BETA FLOOR"]]
extrabg = []
bgname = []
mu = [-1]
mus = [[17, "DUNGEON\nCRAWLING"], [24, "THE OLD\nPIZZAMART"], [10, "PRICES TO\nDIE FOR"], [0, "TREASURE\nTROVE"], [14, "PRESS START\nTO PLAY"], [12, "CAVETHING"]]
extramu = []
muname = []
player = undefined
leveledge = -1
rooms = ["UNTITLED"]
curroom = 0
home = 0
widthless = 0
heightless = 0
roomnameedit = -1
prevroomnameedit = roomnameedit
choosehome = 0
rememberctrl = 0
version = 1
global.leveltosave = "custom"
global.customkilledbaddies = 10
global.custompoints = 1500
global.returneditor = []
global.returndoor = []
global.returnlevel = []
global.returnpoint = []
global.returnbaddie = []
