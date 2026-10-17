if (instance_number(obj_enemy) < 4 && (obj_player.index % 540) == 0)
{
    var chosen_enemy = choose(37, 37, 36, 20, 20, 38, 17);
    instance_create_depth(random_range(0, room_width), 0, depth, chosen_enemy);
}
