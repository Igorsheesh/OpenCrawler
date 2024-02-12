function scr_paltoarr(argument0, argument1) //gml_Script_scr_paltoarr
{
    var width = sprite_get_width(argument0)
    var height = sprite_get_height(argument0)
    var numColors = height
    var colorArray = array_create(numColors)
    for (var i = 0; i < numColors; i++)
    {
        var origColor = sprite_get_pixel(argument0, 0, 0, i)
        var swapColor = sprite_get_pixel(argument0, 0, argument1, i)
        colorArray[i][0][0] = origColor[0]
        colorArray[i][0][1] = origColor[1]
        colorArray[i][0][2] = origColor[2]
        colorArray[i][1][0] = swapColor[0]
        colorArray[i][1][1] = swapColor[1]
        colorArray[i][1][2] = swapColor[2]
    }
    return colorArray;
}

