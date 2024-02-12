function tile_layer_delete_at(argument0, argument1, argument2) //gml_Script_tile_layer_delete_at
{
    var _tilemap_id = layer_tilemap_get_id(argument0)
    tilemap_set_at_pixel(_tilemap_id, 0, argument1, argument2)
}

