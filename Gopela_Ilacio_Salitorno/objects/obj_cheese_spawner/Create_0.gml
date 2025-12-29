/// @description Spawn Cheese (Adjusted for Gift Teleports)
var _tilemap = layer_tilemap_get_id("Collision");
var _tilemap_tree = -1;
if (layer_exists("Tree_Collision")) {
    _tilemap_tree = layer_tilemap_get_id("Tree_Collision");
}
var tile_size = 16;

// Get camera boundaries
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

var padding = 32;
var min_distance = 48;
var cheese_positions = [];

// CHECK GLOBAL VARIABLE (not mouse instance - spawner runs before mouse Create!)
var cheese_to_spawn = 12;

if (global.teleported_by_gift && global.mouse_cheese_collected > 0) {
    cheese_to_spawn = 12 - global.mouse_cheese_collected;
    show_debug_message("=== GIFT TELEPORT DETECTED ===");
    show_debug_message("Mouse already has: " + string(global.mouse_cheese_collected));
    show_debug_message("Spawning only: " + string(cheese_to_spawn) + " cheese");
}

var cheese_spawned = 0;
var max_attempts = 3000;

while (cheese_spawned < cheese_to_spawn && max_attempts > 0) {
    var grid_x = irandom_range((cam_x + padding) / tile_size, (cam_x + cam_width - padding) / tile_size) * tile_size;
    var grid_y = irandom_range((cam_y + padding) / tile_size, (cam_y + cam_height - padding) / tile_size) * tile_size;
    
    var tile_check = tilemap_get_at_pixel(_tilemap, grid_x, grid_y);
    var tree_check = 0;
    if (_tilemap_tree != -1) {
        tree_check = tilemap_get_at_pixel(_tilemap_tree, grid_x, grid_y);
    }
    
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
    
    if (tile_check == 0 && tree_check == 0 && !too_close) { 
        instance_create_layer(grid_x, grid_y, "Instances_1", obj_cheese);
        array_push(cheese_positions, [grid_x, grid_y]);
        cheese_spawned += 1;
        show_debug_message("Cheese #" + string(cheese_spawned) + " spawned at (" + string(grid_x) + ", " + string(grid_y) + ")");
    }
    
    max_attempts -= 1;
}

show_debug_message("=== TOTAL SPAWNED: " + string(cheese_spawned) + " cheese ===");
alarm[0] = 10 * room_speed;