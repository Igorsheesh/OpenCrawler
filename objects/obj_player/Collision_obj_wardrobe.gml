if ((keyboard_check(key_interact) || gamepad_button_check(playernum, gp_face2)) && (!global.pausedisable2) && palswapcooldown <= 0)
{
    if (object_index != obj_player2)
    {
        if ((palselect + 1) != 9)
            palselect++
        else
            palselect = 0
        ini_open("savedata.ini")
        ini_write_string("palette", "currentpalette", obj_player.palselect)
        ini_close()
        with (instance_create_layer(x, y, "Instances", obj_lock_dead))
        {
            hsp = irandom_range(-6, 6)
            vsp = irandom_range(-6, 6)
            spr_pal = other.spr_pal
            usepalette = 1
            paletteselect = (other.palselect - 1)
            sprite_index = spr_shirt
        }
        palswapcooldown = 20
    }
}
