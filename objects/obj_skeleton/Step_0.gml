index++;

if (found_player)
{
    move_x = sign(obj_player.x - x);
    hsp = move_x * spd;
    
    if (!place_meeting(x + hsp, y, obj_block))
        x += (hsp * reverse);
}
else if (abs(x - obj_player.x) < 24)
{
    found_player = 1;
}

if (hp <= 0)
    instance_destroy();

if (random_range(0, 100) > 99.5)
    reverse = -1;

if (random_range(0, 100) > 98)
    reverse = 1;

if ((index % 180) == 0 && found_player && obj_player.x != x)
{
    var dir = sign(obj_player.x - x);
    clone = instance_create_depth(x, y, depth + 1, obj_skeleton_arrow);
    clone.image_xscale = dir;
}
