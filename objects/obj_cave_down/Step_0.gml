if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(ord("S")))
    {
        room_goto(target_room);
        sound(26);
    }
}

image_index = place_meeting(x, y, obj_player);
