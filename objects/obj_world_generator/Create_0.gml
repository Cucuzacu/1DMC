i = 0;

while (i < room_width)
{
    if (random_range(0, 100) > 30)
        instance_create_depth(i, 0, depth, obj_tree_creator);
    else
        instance_create_depth(i, 0, depth, obj_dirt_creator);
    
    i += choose(64, 72, 80, 88);
}

for (i = 0; i < 10; i++)
    instance_create_depth(random_range(8, room_width - 8), 0, depth, obj_pig);

instance_destroy();
