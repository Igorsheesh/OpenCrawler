if (realy >= 930 && timer >= 0)
    realy -= 3
switch room
{
    case Tutorial_1:
        if global.challengemodeunlock
            instance_destroy()
        break
}

timer--
if (timer <= 0)
    realy++
if (realy >= 1200)
    instance_destroy()
