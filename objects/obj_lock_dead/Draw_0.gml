var ex;
shader_set(shd_pal)
if usepalette
{
    try_hook(588, 644)
    var numColors = array_length(palarray)
    var colorsToRep = shader_get_uniform(shd_pal, "u_ColorsToReplace")
    var repColors = shader_get_uniform(shd_pal, "u_ReplacementColors")
    shader_set_uniform_i(shader_get_uniform(shd_pal, "numColors"), numColors)
    var colToRepArr = []
    var repColArr = []
    for (var i = 0; i < numColors; i++)
    {
        var origColor = palarray[i][0]
        var swapColor = palarray[i][1]
        array_push(colToRepArr, origColor[0], origColor[1], origColor[2])
        array_push(repColArr, swapColor[0], swapColor[1], swapColor[2])
    }
    shader_set_uniform_f_array(colorsToRep, colToRepArr)
    shader_set_uniform_f_array(repColors, repColArr)
    try_unhook()
}
draw_self()
shader_reset()
