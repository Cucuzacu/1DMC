draw_self();

if (obj_player.current_pick > 2 && mouse_check_button(mb_left) && (place_meeting(x - 8, y, obj_player) || place_meeting(x + 8, y, obj_player)) && place_meeting(x, y, obj_game))
{
    current_hp -= (0.016666666666666666 * (1 + obj_player.current_pick));
    draw_sprite(spr_mining_animation, (1 - (current_hp / hp)) * sprite_get_number(spr_mining_animation), x, y);
    
    if ((obj_player.index % (18 - (obj_player.current_pick * 3))) == 0)
        sound(mining_sound);
}
else
{
    current_hp = hp;
}

if (current_hp <= 0)
    instance_destroy();
