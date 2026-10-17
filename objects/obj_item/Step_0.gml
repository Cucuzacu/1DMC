image_blend = obj_player.item_colors[| item_index];

if (place_meeting(x, y, obj_player))
{
    if (obj_player.item_amounts[| item_index] < 10)
        ds_list_set_post(obj_player.item_amounts, item_index, obj_player.item_amounts[| item_index] + 1);
    
    instance_destroy();
    sound(21);
}
