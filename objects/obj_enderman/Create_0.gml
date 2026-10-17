spd = 0.22;
found_player = 0;
move_x = 0;
hsp = 0;
hp = 16;

function teleport()
{
    x += random_range(-16, 16);
    clone = instance_create_depth(x, y, depth - 1, obj_block_broke);
    clone.image_blend = c_purple;
    x += random_range(-16, 16);
    sound(22);
}
