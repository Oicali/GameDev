/// @description Spawn 15 Cheese (Inside Camera View)
var _tilemap = layer_tilemap_get_id("Collision");
var tile_size = 16;

// Get camera boundaries
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// Add some padding so cheese aren't at edge
var padding = 32;

// Minimum distance between cheese
var min_distance = 48;

// List to track spawned cheese positions
var cheese_positions = [];

var cheese_spawned = 0;
var max_attempts = 3000;

while (cheese_spawned < 12 && max_attempts > 0) {
    // Random position INSIDE camera view
    var grid_x = irandom_range((cam_x + padding) / tile_size, (cam_x + cam_width - padding) / tile_size) * tile_size;
    var grid_y = irandom_range((cam_y + padding) / tile_size, (cam_y + cam_height - padding) / tile_size) * tile_size;
    
    // Check 1: Not in collision tile
    var tile_check = tilemap_get_at_pixel(_tilemap, grid_x, grid_y);
    
    // Check 2: Not too close to other cheese
    var too_close = false;
    for (var i = 0; i < array_length(cheese_positions); i++) {
        var other_x = cheese_positions[i][0];
        var other_y = cheese_positions[i][1];
        var dist = point_distance(grid_x, grid_y, other_x, other_y);
        
        if (dist < min_distance) {
            too_close = true;
            break;
        }
    }
    
    // If valid position: spawn cheese
    if (tile_check == 0 && !too_close) {
        instance_create_layer(grid_x, grid_y, "Instances_1", obj_cheese);
        
        // Store position
        array_push(cheese_positions, [grid_x, grid_y]);
        
        cheese_spawned += 1;
        show_debug_message("Cheese #" + string(cheese_spawned) + " spawned at (" + string(grid_x) + ", " + string(grid_y) + ")");
    }
    
    max_attempts -= 1;
}

show_debug_message("=== TOTAL SPAWNED: " + string(cheese_spawned) + " cheese ===");

// DON'T DESTROY - Set alarm for teleportation
alarm[0] = 12 * room_speed;  // 15 seconds