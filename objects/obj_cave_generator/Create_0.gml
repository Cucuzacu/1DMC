for (i = 0; i < room_width; i += 8)
{
    if (random_range(0, 100) > 50)
    {
        if (random_range(0, 100) > 50)
            instance_create_depth(i, 0, depth, obj_stone_block);
        else if (is_iron && random_range(0, 100) > 50)
            instance_create_depth(i, 0, depth, obj_iron_block);
        else if (is_diamond && random_range(0, 100) > 60)
            instance_create_depth(i, 0, depth, obj_diamond_block);
    }
}

instance_destroy();
