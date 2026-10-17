var cam = view_camera[0];
view_enabled = true;
camera_set_view_size(cam, 96, 1);
camera_set_view_border(cam, 48, 1);
camera_set_view_target(cam, id);
view_wport[0] = 96;
view_hport[0] = 1;

if (room != rm_overworld)
    x = room_width / 2;
