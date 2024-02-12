image_speed = 1
ini_open("savedata.ini")
usepalette = 1
paletteselect = ini_read_real("palette", "currentpalette", 1)
palarray = []
spr_pal = 7
palgenerated = 0
prevpalselect = 0
ini_close()
