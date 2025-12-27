hover = (mouse_x >= bbox_left && mouse_x <= bbox_right && 
         mouse_y >= bbox_top && mouse_y <= bbox_bottom);


if (hover && mouse_check_button_released(mb_left)) {
    with (obj_howtoplay_menu) {
        visible = true;
        active = true;
        current_page = 1;
    }
}

if (hover && mouse_check_button(mb_left)) {
    target_scale = 0.92;
} else if (hover) {
    target_scale = 1.08;
} else {
    target_scale = 1.0;
}