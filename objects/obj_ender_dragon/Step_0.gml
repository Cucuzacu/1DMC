if (hp <= 0)
    room_goto(rm_win);

if (phase == "roam")
{
    if (abs(hsp) < 2 || sign(hsp) != dir)
        hsp += (dir * 0.01);
    
    if (random_range(0, 100) > 97)
        dir *= -1;
    
    if (x < 0)
        dir = 1;
    
    if (x > room_width)
        dir = -1;
    
    if (random_range(0, 1000) > 998)
        phase = "perch";
}

if (phase == "perch")
{
    if (abs(x - (room_width / 2)) > 8)
        hsp = sign((room_width / 2) - x);
    else
        hsp = 0;
    
    if (random_range(0, 1000) > 995)
        phase = "roam";
}

x += hsp;

if (random_range(0, 1000) > 990)
    sound(4);

if (random_range(0, 1000) > 980)
    sound(7);
