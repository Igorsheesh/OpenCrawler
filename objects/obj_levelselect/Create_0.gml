select = 1
levelcount = 1
floorcount = 1
coolfactor = 20
vertcool = 20
floorselect = 0
selectedlv = "hub1"
if (room == rm_playtest)
{
    editorlevel = global.ugggghhhh[0]
    editorroom = global.ugggghhhh[1]
    editordoor = global.ugggghhhh[2]
}
else
{
    editorlevel = "NO NAME"
    editorroom = "UNTITLED"
    editordoor = "A"
}
delay = 80
if (room == rm_playtest)
    global.leveltosave = (editorlevel + "_editor")
else
    global.leveltosave = "pizzadungeon"
set = 0
fakex = 0
fakey = 0
playernum = 0
