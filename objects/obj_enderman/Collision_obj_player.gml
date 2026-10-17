if (other.invincibility_frames <= 0)
{
    obj_player.hp--;
    x += (sign(x - obj_player.x) * 2);
    other.invincibility_frames = 60;
    teleport();
    sound(5);
}
