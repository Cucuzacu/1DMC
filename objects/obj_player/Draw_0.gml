index++;

if (invincibility_frames < 0 || (index % 10) < 5)
    draw_self();

inventory_x += (((-96 + (inventory_pause * 96)) - inventory_x) / 8);
inventory_display_x = inventory_x + camera_get_view_x(view_camera[0]);
var camx = camera_get_view_x(view_camera[0]);
var camw = inventory_display_x;
draw_set_color(c_red);
draw_rectangle((camx + 96) - ceil(hp / 2), 0, camx + 96, 1, false);
draw_sprite(spr_inventory_menu, index div 20, inventory_display_x, 0);

if (inventory_pause)
{
    var inventoryxs = [36, 45, 54, 70];
    
    for (i = 0; i < 3; i++)
    {
        if (inventory_slots[i] != 0)
        {
            draw_set_color(item_colors[| array_get(inventory_slots, i)]);
            draw_rectangle(inventoryxs[i] + camw + 1, 0, inventoryxs[i] + 4 + camw, 1, false);
            draw_set_color(c_white);
        }
    }
    
    draw_sprite(spr_result_items, result_slot, camw + 70, 0);
    draw_sprite(spr_pickaxes, current_pick, (camw + 96) - 14, 0);
    draw_sprite(spr_swords, current_sword, (camw + 96) - 9, 0);
    draw_sprite(spr_bows, current_bow, (camw + 96) - 4, 0);
}

if (inventory_pause)
{
    var click = mouse_check_button_released(mb_any);
    
    if (click)
    {
        var clicked_slot = -1;
        var mousex = mouse_x - camw;
        
        if (mousex > 36 && mousex < 42)
            clicked_slot = 0;
        
        if (mousex > 45 && mousex < 51)
            clicked_slot = 1;
        
        if (mousex > 54 && mousex < 60)
            clicked_slot = 2;
        
        if (mousex > 69 && mousex < 75)
            clicked_slot = 3;
        
        if (clicked_slot != -1)
        {
            if (clicked_slot < 3)
            {
                if (inventory_slots[clicked_slot] == 0)
                {
                    if (item_amounts[| selected_item] > 0)
                    {
                        inventory_slots[clicked_slot] = selected_item;
                        ds_list_set_post(item_amounts, selected_item, item_amounts[| selected_item] - 1);
                        sound(33);
                    }
                    else
                    {
                    }
                }
                else
                {
                    item_amounts[| array_get(inventory_slots, clicked_slot)] = item_amounts[| array_get(inventory_slots, clicked_slot)] + 1;
                    inventory_slots[clicked_slot] = 0;
                    sound(21);
                }
            }
            else if (result_slot != 0)
            {
                sound(33);
                
                switch (result_slot)
                {
                    case 1:
                        current_pick = max(current_pick, 1);
                        break;
                    
                    case 2:
                        current_pick = max(current_pick, 2);
                        break;
                    
                    case 3:
                        current_pick = max(current_pick, 3);
                        break;
                    
                    case 4:
                        current_pick = max(current_pick, 4);
                        break;
                    
                    case 5:
                        current_sword = max(current_sword, 1);
                        break;
                    
                    case 6:
                        current_sword = max(current_sword, 2);
                        break;
                    
                    case 7:
                        current_sword = max(current_sword, 3);
                        break;
                    
                    case 8:
                        current_bow = max(current_bow, 1);
                        arrows += 15;
                        break;
                }
                
                inventory_slots = [0, 0, 0];
            }
            else
            {
            }
        }
    }
    
    if (array_equals(inventory_slots, [2, 2, 2]))
        result_slot = 1;
    else if (array_equals(inventory_slots, [2, 2, 3]))
        result_slot = 2;
    else if (array_equals(inventory_slots, [2, 2, 4]))
        result_slot = 3;
    else if (array_equals(inventory_slots, [2, 2, 5]))
        result_slot = 4;
    else if (array_equals(inventory_slots, [2, 3, 3]))
        result_slot = 5;
    else if (array_equals(inventory_slots, [2, 4, 4]))
        result_slot = 6;
    else if (array_equals(inventory_slots, [2, 5, 5]))
        result_slot = 7;
    else if (array_equals(inventory_slots, [2, 6, 2]))
        result_slot = 8;
    else
        result_slot = 0;
}

left_pos = camera_get_view_x(view_camera[0]);
winning_loc = 0;

for (i = 1; i < ds_list_size(item_amounts); i++)
{
    if (item_amounts[| i] > 0)
    {
        if (i == selected_item)
            winning_loc = left_pos;
        
        draw_point_color(left_pos, 0, c_black);
        left_pos++;
        draw_point_color(left_pos, 0, c_black);
        left_pos++;
        draw_point_color(left_pos, 0, c_black);
        left_pos++;
        draw_point_color(left_pos, 0, c_black);
    }
}

draw_set_color(c_white);
draw_rectangle(winning_loc, 0, winning_loc + 3, 1, false);
left_pos = camera_get_view_x(view_camera[0]);

for (i = 1; i < ds_list_size(item_amounts); i++)
{
    if (item_amounts[| i] > 0)
    {
        left_pos++;
        draw_point_color(left_pos, 0, item_colors[| i]);
        left_pos++;
        draw_point_color(left_pos, 0, amount_colors[| ds_list_find_value(item_amounts, i)]);
        left_pos++;
    }
}

if (mouse_check_button_pressed(mb_left))
{
    other_en = collision_point(mouse_x, 0, obj_enemy, 1, 1);
    
    if (other_en)
    {
        if (place_meeting(x + (8 * sign(other_en.x - x)), y, other_en))
        {
            if (mouse_x > x)
            {
                draw_sprite_ext(spr_swords, current_sword, x + 4, y, 1, 1, 0, c_white, 1);
                other_en.x += 3;
                clone = instance_create_depth(x + 8, 0, other.depth - 1, obj_strike_fx);
            }
            else
            {
                draw_sprite_ext(spr_swords, current_sword, x - 4, y, -1, 1, 0, c_white, 1);
                other_en.x -= 3;
                clone = instance_create_depth(x - 8, 0, other.depth - 1, obj_strike_fx);
                clone.image_xscale = -1;
            }
            
            other_en.hp -= current_sword + 1;
            sound(24);
        }
        else if (arrows > 0)
        {
            var dir = sign(other_en.x - x);
            clone = instance_create_depth(x, y, depth + 1, obj_arrow);
            clone.image_xscale = dir;
            arrows--;
        }
        else
        {
        }
    }
}

if (arrows <= 0 && current_bow == 1)
    current_bow = 0;
