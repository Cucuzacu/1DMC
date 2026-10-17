if (found_player)
{
    move_x = sign(obj_player.x - x);
    hsp = move_x * spd;
    
    if (!place_meeting(x + hsp, y, obj_block))
        x += hsp;
}
else if (abs(x - obj_player.x) < 24)
{
    found_player = 1;
}

if (hp <= 0)
    instance_destroy();
