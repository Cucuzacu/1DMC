if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(ord("W")))
    {
        if (target_room == 15)
            obj_player.x = obj_player.overworld_pos;
        
        room_goto(target_room);
        sound(18);
    }
}

image_index = place_meeting(x, y, obj_player);
