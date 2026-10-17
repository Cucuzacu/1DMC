index += 1;
depth = 50;

for (i = 0; i < 96; i++)
    draw_point_color(i, 0, make_color_hsv((index + (i * 2)) % 255, 255, 255));
