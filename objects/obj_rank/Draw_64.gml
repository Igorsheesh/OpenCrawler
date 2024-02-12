draw_sprite_tiled(bg_results, bg, tilex, tiley)
set_text(global.font, 32768, 0)
if (!displaypoints)
    draw_text_transformed(800, 180, "POINTS: ", 2, 2, 0)
else
    draw_text_transformed(800, 180, string_concat("POINTS: ", global.points), 2, 2, 0)
if (displaypoints && (!displayenemykill))
    draw_text_transformed(800, 260, "BADDIES KILLED: ", 2, 2, 0)
else if (displaypoints && displayenemykill)
    draw_text_transformed(800, 260, string_concat("BADDIES KILLED: ", global.killedbaddies), 2, 2, 0)
if ((!displayrank) && displaypoints && displayenemykill)
    draw_text_transformed(800, 340, "RANK:  ", 2, 2, 0)
else if (displayrank && displaypoints && displayenemykill)
    draw_text_transformed(800, 340, string_concat("RANK: ", rank), 2, 2, 0)
scr_palswap_set(obj_player.palarray)
if (!displayrank)
    draw_sprite_ext(spr_idle, -1, 0, 0, 4, 4, 0, c_white, 1)
else if (displayrank && (!global.coop))
{
    if (rank == "S")
        draw_sprite_ext(spr_rankG_great, image_index, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "A")
        draw_sprite_ext(spr_rankG_great, image_index, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "B")
        draw_sprite_ext(spr_rankG_eh, image_index, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "C")
        draw_sprite_ext(spr_rankG_bad, image_index, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "D")
        draw_sprite_ext(spr_rankG_bad, image_index, 0, 0, 4, 4, 0, c_white, 1)
}
else if (displayrank && global.coop)
{
    if (rank == "S")
        draw_sprite_ext(spr_rankGB_great, -1, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "A")
        draw_sprite_ext(spr_rankGB_great, -1, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "B")
        draw_sprite_ext(spr_rankGB_eh, -1, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "C")
        draw_sprite_ext(spr_rankGB_bad, -1, 0, 0, 4, 4, 0, c_white, 1)
    else if (rank == "D")
        draw_sprite_ext(spr_rankGB_bad, -1, 0, 0, 4, 4, 0, c_white, 1)
}
if global.collectable1
    draw_sprite_ext(spr_collectable1, image_index, 860, 1000, 4, 4, 1, c_white, 1)
if global.collectable2
    draw_sprite_ext(spr_collectable2, image_index, 1048, 1000, 4, 4, 0, c_white, 1)
if global.collectable3
    draw_sprite_ext(spr_collectable3, image_index, 1236, 1000, 4, 4, 0, c_white, 1)
if global.collectable4
    draw_sprite_ext(spr_collectable4, image_index, 1424, 1000, 4, 4, 0, c_white, 1)
if global.collectable5
    draw_sprite_ext(spr_collectable5, image_index, 1612, 1000, 4, 4, 0, c_white, 1)
