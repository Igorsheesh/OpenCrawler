y -= (0.5 * verticlespeed)
if (image_alpha <= 0)
    instance_destroy(id, false)
switch sprite_index
{
    case spr_collectable1:
    case 242:
    case 303:
    case 15:
    case 331:
        image_index = 0
        break
    case 8:
        image_xscale = 1
        break
    case 269:
        var _textforuser = "IF YOUR READING THIS YOU ARE NOW CURSED BY ANDY"
        break
}

