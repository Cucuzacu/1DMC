spd = 0;
found_player = 0;
move_x = 0;
hsp = 0;
hp = 1;
x += choose(-16, -8, 0, 8, 16);

if (random_range(0, 100) > 40)
{
    instance_create_depth(x - 8, y, depth, obj_obsidian);
    instance_create_depth(x + 8, y, depth, obj_obsidian);
}
