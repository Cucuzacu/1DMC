invincibility_frames--;
var input_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var input_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var walkspeed = 0.5;
var move_x = -input_left + input_right;
hsp = move_x * walkspeed;

if (place_meeting(x + hsp, y, obj_block))
    hsp = 0;

x += hsp;

if (move_x == 0)
    image_index = 0;
else if (move_x > 0)
    image_index = 1;
else
    image_index = 2;

if (item_amounts[| selected_item] == 0)
    selected_item += scroll_dir;

if (selected_item >= ds_list_size(item_colors))
    selected_item = 0;

if (selected_item < 0)
    selected_item = ds_list_size(item_colors) - 1;

if (mouse_wheel_down())
{
    selected_item++;
    scroll_dir = 1;
}

if (mouse_wheel_up())
{
    selected_item--;
    scroll_dir = -1;
}

if (hp <= 0)
{
    room_goto(rm_game_over);
    instance_destroy();
}

if (room == rm_overworld)
    overworld_pos = x;

if (hsp != 0)
{
    if ((index % 30) == 0)
        sound(1);
}

if (room != rm_overworld && random_range(0, 1000) > 998)
{
    if (random_range(0, 1000) > 500)
        sound(2);
    else
        sound(12);
}
