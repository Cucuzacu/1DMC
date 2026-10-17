if (!audio_is_playing(snd_portal))
    sound(19);

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(ord("S")))
    {
        room_goto(rm_end);
        sound(29);
    }
}
