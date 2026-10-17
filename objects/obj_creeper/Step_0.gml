if (found_player)
{
    move_x = sign(obj_player.x - x);
    hsp = move_x * spd;
    
    if (!place_meeting(x + hsp, y, obj_block))
        x += hsp;
}
else if (abs(x - obj_player.x) < 24)
{
    found_player = 1;
}

if (hp <= 0)
    instance_destroy();

if (abs(x - obj_player.x) < 14)
{
    spd = 0;
    
    if (hiss_amount <= 0)
        sound(32);
    
    hiss_amount += 0.016;
    
    if (hiss_amount >= 1)
    {
        instance_create_depth(x, y, depth - 50, obj_explosion);
        instance_destroy();
    }
}
else
{
    spd = 0.14;
    
    if (hiss_amount > 0)
        hiss_amount -= 0.04;
    
    if (audio_is_playing(snd_creeper_hiss) && hiss_amount > 0)
        audio_stop_sound(snd_creeper_hiss);
}
