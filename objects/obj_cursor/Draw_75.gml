if (!mouse_check_button(mb_left))
    draw_sprite(spr_hand_idle, -1, mouse_xadjust, mouse_yadjust)
else
    draw_sprite(spr_hand_click, -1, mouse_xadjust, mouse_yadjust)
