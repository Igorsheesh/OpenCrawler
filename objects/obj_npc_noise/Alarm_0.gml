if (hsp == 0 && vsp == 0)
{
    if irandom_range(0, 1)
        hsp = irandom_range(-2, 2)
    else
        vsp = irandom_range(-2, 2)
}
else
{
    var bufffet = hsp
    if (vsp == 0)
        hsp = irandom_range(-2, 2)
    else
        hsp = 0
    if (bufffet == 0)
        vsp = irandom_range(-2, 2)
    else
        vsp = 0
}
