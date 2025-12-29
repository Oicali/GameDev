/// @description Teleport All Remaining Cheese with Effects (Fixed)
show_debug_message("=== TELEPORTING REMAINING CHEESE ===");

var _tilemap = layer_tilemap_get_id("Collision");
var tile_size = 16;

// Get camera boundaries
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

var padding = 32;
var min_distance = 48;

// Get all remaining cheese
var cheese_list = [];
with (obj_cheese) {
    array_push(cheese_list, id);
}

var cheese_count = array_length(cheese_list);
show_debug_message("Found " + string(cheese_count) + " remaining cheese to teleport");

// If no cheese left, stop teleporting
if (cheese_count == 0) {
    show_debug_message("=== NO CHEESE LEFT - STOPPING TELEPORT ===");
    exit;  // Don't set alarm again
}

// Play sound ONCE at the start (not per cheese)
audio_play_sound(teleport_in, 1, false);
audio_sound_gain(teleport_in, 0.5, 0);

// Find new positions for each cheese
for (var i = 0; i < cheese_count; i++) {
    var cheese_id = cheese_list[i];
    
    if (instance_exists(cheese_id)) {
        var valid_position = false;
        var attempts = 0;
        var max_attempts = 200;
        
        while (!valid_position && attempts < max_attempts) {
            // Random position in camera view
            var new_x = irandom_range((cam_x + padding) / tile_size, (cam_x + cam_width - padding) / tile_size) * tile_size;
            var new_y = irandom_range((cam_y + padding) / tile_size, (cam_y + cam_height - padding) / tile_size) * tile_size;
            
            // Check 1: Not in collision
            var tile_check = tilemap_get_at_pixel(_tilemap, new_x, new_y);
            
            // Check 2: Not too close to other cheese
            var too_close = false;
            with (obj_cheese) {
                if (id != cheese_id) {
                    var dist = point_distance(new_x, new_y, x, y);
                    if (dist < min_distance) {
                        too_close = true;
                        break;
                    }
                }
            }
            
            // Valid position found
            if (tile_check == 0 && !too_close) {
                // Start teleport animation (NO SOUND HERE)
                cheese_id.is_teleporting = true;
                cheese_id.teleport_phase = 1;  // Start fade out
                cheese_id.teleport_timer = 0;
                cheese_id.target_x = new_x;
                cheese_id.target_y = new_y;
                
                valid_position = true;
                show_debug_message("Cheese will teleport to (" + string(new_x) + ", " + string(new_y) + ")");
            }
            
            attempts += 1;
        }
    }
}

show_debug_message("=== TELEPORT INITIATED ===");

// Play teleport IN sound ONCE after 20 frames (when cheese reappear)
alarm[1] = 20;

// Set next teleport in 12 seconds (only if cheese still exist)
alarm[0] = 10 * room_speed;