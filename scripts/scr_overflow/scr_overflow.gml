function scr_overflow(argument0, argument1, argument2) //gml_Script_scr_overflow
{
    if (argument0 < argument1)
        return argument2;
    else if (argument0 > argument2)
        return argument1;
    else
        return argument0;
}

