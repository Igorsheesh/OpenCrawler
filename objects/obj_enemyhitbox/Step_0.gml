if ((!instance_exists(enemyid)) && enemyid != noone)
{
    enemyid = noone
    instance_destroy(id, false)
}
if (enemyid != noone)
{
    x = enemyid.x
    y = enemyid.y
}
