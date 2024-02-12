scr_palswap_set(palarray)
draw_self()
if drawpalsprite
    draw_sprite(spr_wardrobe_paletteind, 0, x, (y - 40))
shader_reset()
