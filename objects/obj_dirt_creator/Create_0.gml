var dirt_patch_len = choose(3, 4, 5, 6);

for (i = 0; i < dirt_patch_len; i++)
{
    if (i == 0 || i == (dirt_patch_len - 1))
        instance_create_depth(x + (i * 8), 0, depth, obj_grass_block);
    else
        instance_create_depth(x + (i * 8), 0, depth, obj_dirt_block);
}

instance_destroy();
