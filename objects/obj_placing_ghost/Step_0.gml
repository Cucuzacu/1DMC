visible = false;

if (instance_exists(obj_player))
{
    if (mouse_check_button(mb_right))
        visible = true;
    
    x = mouse_x + 4;
    y = 0;
    x = (x div 8) * 8;
    
    if (mouse_check_button_released(mb_right) && !place_meeting(x, y, obj_block) && !place_meeting(x, y, obj_player) && !place_meeting(x, y, obj_enemy))
    {
        if (obj_player.item_amounts[| obj_player.selected_item] > 0)
        {
            var placing_block = obj_player.block_list[| obj_player.selected_item];
            instance_create_depth(x, y, depth, placing_block);
            ds_list_set_post(obj_player.item_amounts, obj_player.selected_item, obj_player.item_amounts[| obj_player.selected_item] - 1);
        }
    }
}
