scr_initinput()
scr_getinput()
ini_open("savedata.ini")
isup = 0
isright = 0
isleft = 0
isdown = 1
isupleft = 0
isupright = 0
isdownright = 0
isdownleft = 0
palarray = []
spr_pal = 7
palgenerated = 0
palselect = ini_read_real("palette", "currentpalette", 1)
prevpalselect = 0
palswapcooldown = 10
savedpal = ini_read_real("palette", "currentpalette", 1)
state = (0 << 0)
lv = ini_read_string("levelup", "lv", 1)
stamina = 20
maxstamina = 20
playerhp = 3
hp = 3
maxhp = 3
inputlocked = 0
spr_idle = 309
movey = 1
movex = 1
movexright = 1
moveydown = 1
movespeed = 2
depth = -5
haskey = 0
keytimer = 0
global.level1unlock = ini_read_real("levelunlocks", "levelone", 0)
global.challengemodeunlock = ini_read_string("pizzadungeon", "beaten", "false")
ini_close()
playernum = 0
gamepad_set_axis_deadzone(0, 0.5)
vsp = 0
hsp = 0
movex = 0
movey = 0
global.cheeseslimemode = 0
character = "G"
characterspr()
target_door = ""
fill = 0
if (room == rm_hub1 && global.coop && (!instance_exists(obj_player2)))
    instance_create_layer(x, y, "Instances", obj_player2)
global.killedbaddies = 0
global.points = 0
global.currentlevel = 0
global.leveltosave = "hub1"
invincibility = 0
iframes = 60
dead = 0
global.debug = 0
global.treasuresprite = 227
firetran = 0
