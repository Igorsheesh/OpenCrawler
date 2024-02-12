if global.panic
{
    visible = true
    image_speed = 0.5
    if (floor(image_index) == (image_number - 1) && cooldown == 0)
    {
        cooldown = 1
        with (instance_create_layer(x, (y - 600), "Instances", obj_fallingbrick))
            brickID = other.id
    }
}
else
{
    visible = false
    image_speed = 0
}
