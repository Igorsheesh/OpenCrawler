tilex++
tiley--
scroll--
scrollspr = 222
if (scroll <= -1632)
{
    if (!instance_exists(obj_notif))
    {
        with (instance_create_layer(x, y, "Instances", obj_notif))
            notiftext = "THANKS FOR\nPLAYING THE DEMO"
    }
}
