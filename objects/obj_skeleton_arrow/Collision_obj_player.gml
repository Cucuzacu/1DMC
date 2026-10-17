if (other.invincibility_frames < 0)
{
    obj_player.hp -= 1;
    obj_player.invincibility_frames = 30;
}

sound(30);
instance_destroy();
