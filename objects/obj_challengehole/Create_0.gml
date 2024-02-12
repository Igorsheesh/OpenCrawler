ini_open("savedata.ini")
if (ini_read_string("pizzadungeon", "beaten", "false") != "true")
    instance_destroy()
ini_close()
menu = 0
inputcooldown = 60
select = 1
cooldown = 60
