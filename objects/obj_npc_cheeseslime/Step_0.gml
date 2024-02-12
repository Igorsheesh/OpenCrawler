if (!active)
    currentChar = 1
if (distance_to_object(obj_player) > 30 && active)
    active = 0
if active
    sprite_index = spr_move
else
    sprite_index = spr_idle
if (global.panic && (!panicking))
{
    panicking = 1
    text = "DID YOU TOUCH THE BEAN?"
}
