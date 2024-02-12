var error;
if (!set)
{
    set = 1
    normalspr = scr_asset_get_index(normalspr, 1)
    panicspr = scr_asset_get_index(panicspr, 1)
    var sprtouse = (panicspr == undefined ? spr_actor : panicspr)
    if (normalspr == undefined)
        normalspr = sprtouse
    if (panicspr == undefined)
        panicspr = normalspr
    try_hook(292, 328)
    image_speed = real(imgspeed)
    try_unhook()
}
if global.panic
    sprite_index = panicspr
else
    sprite_index = normalspr
