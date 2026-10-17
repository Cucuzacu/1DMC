if (image_index == 0)
    game_end();
else if (image_index == 1)
    game_restart();
else
    room_goto_next();

sound(27);
