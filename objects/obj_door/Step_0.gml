if (opened == 1)
    sprite_index = spr_dungeon_door
else if (locked == 0 && opened == 0)
    sprite_index = spr_dungeon_doorclose
if (opened == 1)
    mask_index = spr_null
if (opened == 0)
    depth = -4
else
    depth = -6
if (locked == 1 && opened == 0)
{
    sprite_index = spr_dungeon_doorlock
    mask_index = spr_door_closed
}
interactcooldown--
