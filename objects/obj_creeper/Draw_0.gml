if (hsp == 0)
    image_index = 0;
else if (hsp < 0)
    image_index = 2;
else
    image_index = 1;

draw_self();
draw_set_alpha(hiss_amount);
draw_sprite(spr_creeper_mask, 0, x, y);
draw_set_alpha(1);
