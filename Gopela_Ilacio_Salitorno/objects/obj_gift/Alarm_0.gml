/// @description Respawn gift within camera view (avoid collision - SCALED SIZE)
show_debug_message("=== ALARM 0 TRIGGERED ===");

// Get tilemap for collision checking
var _tilemap = layer_tilemap_get_id("Collision");
var _tilemap_tree = -1;
if (layer_exists("Tree_Collision")) {
    _tilemap_tree = layer_tilemap_get_id("Tree_Collision");
}

// Get camera bounds
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Try to find valid spawn position
var valid_position = false;
var attempts = 0;
var max_attempts = 200;
var new_x = x;
var new_y = y;

// Use ACTUAL displayed size (considering scale)
// Original: 52x64, but scaled to ~0.38 x 0.40
var gift_width = (sprite_width * image_xscale) / 2;   // Half width
var gift_height = (sprite_height * image_yscale) / 2; // Half height

show_debug_message("Gift collision size: " + string(gift_width * 2) + "x" + string(gift_height * 2));

while (!valid_position && attempts < max_attempts) {
    // Random position within camera view
    new_x = cam_x + irandom_range(60, cam_w - 60);
    new_y = cam_y + irandom_range(60, cam_h - 60);
    
    // Make sure it's within room bounds
    new_x = clamp(new_x, 60, room_width - 60);
    new_y = clamp(new_y, 60, room_height - 60);
    
    // Check MULTIPLE points around the gift (using scaled size!)
    var check_center = tilemap_get_at_pixel(_tilemap, new_x, new_y);
    var check_top = tilemap_get_at_pixel(_tilemap, new_x, new_y - gift_height);
    var check_bottom = tilemap_get_at_pixel(_tilemap, new_x, new_y + gift_height);
    var check_left = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y);
    var check_right = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y);
    
    // Check all 4 corners
    var check_tl = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y - gift_height);
    var check_tr = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y - gift_height);
    var check_bl = tilemap_get_at_pixel(_tilemap, new_x - gift_width, new_y + gift_height);
    var check_br = tilemap_get_at_pixel(_tilemap, new_x + gift_width, new_y + gift_height);
    
	// ADD TREE CHECKS BELOW:
// ADD TREE CHECKS ONLY IF LAYER EXISTS:
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

    // Valid only if ALL points are walkable (tile == 0)
   // Valid only if ALL points are walkable (tile == 0 for BOTH layers)
if (check_center == 0 && check_top == 0 && check_bottom == 0 && 
    check_left == 0 && check_right == 0 &&
    check_tl == 0 && check_tr == 0 && check_bl == 0 && check_br == 0 &&
    tree_center == 0 && tree_top == 0 && tree_bottom == 0 &&
    tree_left == 0 && tree_right == 0 &&
    tree_tl == 0 && tree_tr == 0 && tree_bl == 0 && tree_br == 0) {
        // Valid position found!
        valid_position = true;
        x = new_x;
        y = new_y;
    }
    
    attempts += 1;
}

// If couldn't find valid position, keep current position
if (!valid_position) {
    show_debug_message("WARNING: Couldn't find valid spawn position after " + string(max_attempts) + " attempts");
}

// Make visible and reset collected flag
visible = true;
image_alpha = 1;
collected = false;

audio_play_sound(snd_gift_spawn, 0, false);

show_debug_message("Gift respawned at X:" + string(x) + " Y:" + string(y));
show_debug_message("Camera at X:" + string(cam_x) + " Y:" + string(cam_y));
show_debug_message("Visible: " + string(visible) + " Alpha: " + string(image_alpha));
show_debug_message("Attempts needed: " + string(attempts));