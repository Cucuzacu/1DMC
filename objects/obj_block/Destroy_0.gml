clone = instance_create_depth(x, y, depth, obj_item);
clone.item_index = item_index;
clone = instance_create_depth(x, y, depth - 1, obj_block_broke);
clone.image_blend = obj_player.item_colors[| item_index];
sound(broken_sound);
