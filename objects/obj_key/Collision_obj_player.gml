other.state = (2 << 0)
other.sprite_index = other.spr_peace
other.haskey = 1
other.keytimer = 70
audio_play_sound(sfx_keygot, 2, false)
instance_destroy(self)
ds_list_add(global.saveroom, id)
