for (var yy = 0; yy < abs(image_yscale); yy++)
{
    for (var xx = 0; xx < abs(image_xscale); xx++)
        draw_sprite_ext(sprite_index, image_index, (xstart + (xx * 64)), (ystart + (yy * 64)), 1, 1, 0, c_white, image_alpha)
}
