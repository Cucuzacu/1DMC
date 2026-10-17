var dirt_patch_len = choose(3, 4, 5);

for (i = 0; i < dirt_patch_len; i++)
{
    if (i == 0 || i == (dirt_patch_len - 1))
        instance_create_depth(x + (i * 8), 0, depth, obj_leaves_block);
    else
        instance_create_depth(x + (i * 8), 0, depth, obj_wood_block);
}

if (choose(0, 0, 0, 1))
    instance_create_depth(x - 8, 0, depth, obj_leaves_block);

if (choose(0, 0, 0, 1))
    instance_create_depth(x + (dirt_patch_len * 8), 0, depth, obj_leaves_block);

instance_destroy();
