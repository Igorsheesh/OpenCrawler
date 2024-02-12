function player_reset() //gml_Script_player_reset
{
    state = (0 << 0)
    playerhp = 3
    stamina = maxstamina
    global.panic = 0
    global.points = 0
    global.killedbaddies = 0
    global.leveltosave = "hub1"
    global.collectable1 = 0
    global.collectable2 = 0
    global.collectable3 = 0
    global.collectable4 = 0
    global.collectable5 = 0
    ds_list_clear(global.saveroom)
}

