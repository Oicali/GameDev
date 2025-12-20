/// @description Start hidden, find random position, spawn after 6 seconds
visible = false;
image_alpha = 0;
collected = false;

// Find random spawn position immediately
var _tilemap = layer_tilemap_get_id("Collision");
var _tilemap_tree = -1;
if (layer_exists("Tree_Collision")) {
    _tilemap_tree = layer_tilemap_get_id("Tree_Collision");
}

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var valid_position = false;
var attempts = 0;
var max_attempts = 200;
var new_x = x;
var new_y = y;

var gift_width = (sprite_width * image_xscale) / 2;
var gift_height = (sprite_height * image_yscale) / 2;

while (!valid_position && attempts < max_attempts) {
    new_x = cam_x + irandom_range(60, cam_w - 60);
    new_y = cam_y + irandom_range(60, cam_h - 60);
    
    new_x = clamp(new_x, 60, room_width - 60);
    new_y = clamp(new_y, 60, room_height - 60);
    
    var check_center = tilemap_get_at_pixel(_tilemap, new_x, new_y);
    var check_top = tilemap_get_at_pixel(_tilemap, new_x, new_y - gift_height);
    var check_bottom = tilemap_get_at_pixel(_tilemap, new_x, new_y + gift_height);
    var check_left = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y);
    var check_right = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y);
    var check_tl = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y - gift_height);
    var check_tr = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y - gift_height);
    var check_bl = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y + gift_height);
    var check_br = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y + gift_height);
    
    var tree_center = 0, tree_top = 0, tree_bottom = 0, tree_left = 0, tree_right = 0;
    var tree_tl = 0, tree_tr = 0, tree_bl = 0, tree_br = 0;
    
    if (_tilemap_tree != -1) {
        tree_center = tilemap_get_at_pixel(_tilemap_tree, new_x, new_y);
        tree_top = tilemap_get_at_pixel(_tilemap_tree, new_x, new_y - gift_height);
        tree_bottom = tilemap_get_at_pixel(_tilemap_tree, new_x, new_y + gift_height);
        tree_left = tilemap_get_at_pixel(_tilemap_tree, new_x - gift_width, new_y);
        tree_right = tilemap_get_at_pixel(_tilemap_tree, new_x + gift_width, new_y);
        tree_tl = tilemap_get_at_pixel(_tilemap_tree, new_x - gift_width, new_y - gift_height);
        tree_tr = tilemap_get_at_pixel(_tilemap_tree, new_x + gift_width, new_y - gift_height);
        tree_bl = tilemap_get_at_pixel(_tilemap_tree, new_x - gift_width, new_y + gift_height);
        tree_br = tilemap_get_at_pixel(_tilemap_tree, new_x + gift_width, new_y + gift_height);
    }
    
    if (check_center == 0 && check_top == 0 && check_bottom == 0 && 
        check_left == 0 && check_right == 0 &&
        check_tl == 0 && check_tr == 0 && check_bl == 0 && check_br == 0 &&
        tree_center == 0 && tree_top == 0 && tree_bottom == 0 &&
        tree_left == 0 && tree_right == 0 &&
        tree_tl == 0 && tree_tr == 0 && tree_bl == 0 && tree_br == 0) {
        valid_position = true;
        x = new_x;
        y = new_y;
    }
    
    attempts += 1;
}

show_debug_message("Gift positioned at X:" + string(x) + " Y:" + string(y));

// Spawn after 6 seconds
alarm[1] = 6 * room_speed;