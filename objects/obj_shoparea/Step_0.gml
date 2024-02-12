if (!(place_meeting(x, y, obj_player)))
{
    global.useshoptheme = 0
    image_alpha = clamp((image_alpha + 0.1), 0, 1)
}
if (global.leveltosave == "longchallengeleveljustfordemo")
    sprite_index = Sprite306
