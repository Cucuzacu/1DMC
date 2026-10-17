if (roaming)
{
    var spd = 0.5;
    hsp = dir * spd;
    
    if (!place_meeting(x + hsp, y, obj_block))
        x += hsp;
}

if (hp <= 0)
    instance_destroy();

if (instance_exists(obj_player))
{
    if (abs(x - obj_player.x) < 48 && random_range(0, 100) > 99)
        sound(23);
}
