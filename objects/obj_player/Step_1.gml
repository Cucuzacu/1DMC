time_of_day += (time_dir * time_spd);

if (time_of_day > 1)
    time_dir = -1;

if (time_of_day < 0)
    time_dir = 1;

if (room == rm_overworld)
{
    var bg_layer = layer_background_get_id(layer_get_id("Background"));
    layer_background_blend(bg_layer, make_color_rgb(125 * time_of_day, 255 * time_of_day, 255 * time_of_day));
}

if ((index % 300) == 0 && room == rm_overworld && time_of_day < 0.5)
{
    var chosen_enemy = choose(37, 37, 36, 20, 38, 17);
    clone = instance_create_depth(random_range(0, room_width - 4), 0, 0, chosen_enemy);
}

if (room == rm_overworld && time_of_day > 0.5)
{
    for (i = 0; i < instance_number(obj_enemy); i++)
    {
        current_enemy = instance_find(obj_enemy, i);
        
        if (!current_enemy.is_pig)
        {
            instance_destroy(current_enemy);
            break;
        }
    }
}
