if (obj_ender_dragon.hp < obj_ender_dragon.maxhp)
{
    obj_ender_dragon.hp += 0.5;
    draw_set_color(c_fuchsia);
    draw_set_alpha(0.25);
    draw_line(x, y, obj_ender_dragon.x, y);
    draw_set_alpha(1);
}

draw_self();
