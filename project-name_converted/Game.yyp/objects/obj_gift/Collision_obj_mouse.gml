/// @description collected by mouse
// You can write your code in this editor

/// Collected by mouse

// Check if already collected
if (collected) {
    exit;
}

show_debug_message("Mouse hit gift!");
collected = true;

// Weighted effect pool
var effects = [
   "mouse_fast",  "mouse_fast", 
	 "mouse_slow",   
	"mouse_stun",                
	"mouse_confused",             
	 "cat_fast", 
	  "cat_slow", "cat_slow",
	 "cat_stun", 
	   "cat_confused",  "cat_confused"            
];

// Pick random entry
var chosen = effects[irandom(array_length(effects) - 1)];
var indicator_sprite = noone;
var indicator_color = c_white;
var target_player = noone;
var indicator_offset_x = 0; // NEW: X offset
var indicator_offset_y = -32; // NEW: Y offset (default above head)

// Apply chosen effect
switch(chosen) {
    case "mouse_fast":
        other.spd = other.base_spd + 2;
        other.effect_timer = 5 * room_speed;
		
        indicator_sprite = spr_effect_speed;
        indicator_color = c_lime;
        target_player = other.id;
		
        audio_play_sound(snd_boost, 0, false);
        break;
        
    case "mouse_slow":
        other.spd = other.base_spd - 4;
        if (other.spd < 1) other.spd = 1;
        other.effect_timer = 5 * room_speed;
		
		
        indicator_sprite = spr_effect_slow; // Use same sprite or create spr_effect_slow
        target_player = other.id;
		indicator_color = c_red;
		
        audio_play_sound(snd_slow, 0, false);
        break;
        
    case "mouse_stun":
        other.is_stunned = true;
        other.spd = 0;
        other.effect_timer = 5 * room_speed;

        indicator_sprite = spr_effect_stun; // Use same sprite or create spr_effect_stun
        target_player = other.id;
        audio_play_sound(snd_stun, 0, false);
        break;
        
    case "mouse_confused":
        indicator_offset_x = 5; // Move right by 12 pixels
        indicator_offset_y = -32; // Above head
		
		other.is_confused = true;
        other.effect_timer = 5 * room_speed;
        indicator_sprite = spr_effect_confuse; // Use same sprite or create spr_effect_confused
        target_player = other.id;
        audio_play_sound(snd_confuse, 0, false);
        
        break;
        
    case "cat_fast":
        indicator_sprite = spr_effect_speed;
        indicator_color = c_lime;
    
        // Find the cat instance FIRST
        var cat_instance = instance_find(obj_cat, 0);
    
        if (instance_exists(cat_instance)) {
            cat_instance.spd = cat_instance.base_spd + 2;
            cat_instance.effect_timer = 5 * room_speed;
            target_player = cat_instance; // Save cat reference
        }
    
        audio_play_sound(snd_boost, 0, false);
        show_debug_message("Cat: Speed Boost!");
        break;
        
    case "cat_slow":
        indicator_sprite = spr_effect_slow;
        indicator_color = c_red;
    
        // Find the cat instance FIRST
        var cat_instance = instance_find(obj_cat, 0);
		
        if (instance_exists(cat_instance)) {
            cat_instance.spd = cat_instance.base_spd - 4;
			if (cat_instance.spd < 1) cat_instance.spd = 1; 
            cat_instance.effect_timer = 5 * room_speed;
            target_player = cat_instance;
        }
    
        audio_play_sound(snd_slow, 0, false);
        break;
        
    case "cat_stun":
        indicator_sprite = spr_effect_stun; // Use same sprite or create spr_effect_stun
		
		// Find the cat instance FIRST
        var cat_instance = instance_find(obj_cat, 0);
		
		if (instance_exists(cat_instance)) {
			cat_instance.is_stunned = true;	
			cat_instance.spd = 0;
            cat_instance.effect_timer = 5 * room_speed;
            target_player = cat_instance;
        }
        
        audio_play_sound(snd_stun, 0, false);
        break;
        
    case "cat_confused":
        indicator_sprite = spr_effect_confuse; // Use same sprite or create spr_effect_confused
		indicator_offset_x = 12; // Move right by 12 pixels
        indicator_offset_y = -32; // Above head


		// Find the cat instance FIRST
        var cat_instance = instance_find(obj_cat, 0);
		
		if (instance_exists(cat_instance)) {
			cat_instance.is_confused = true;	
            cat_instance.effect_timer = 5 * room_speed;
            target_player = cat_instance;
        }
       
        
        audio_play_sound(snd_confuse, 0, false);
        break;
}

// CREATE THE VISUAL INDICATOR
if (indicator_sprite != noone && instance_exists(target_player)) {
    var indicator = instance_create_layer(
        target_player.x + indicator_offset_x,
        target_player.y + indicator_offset_y, 
        "effects_indicator", 
        obj_effect_indicator
    );
    
    indicator.target = target_player;
    indicator.sprite_index = indicator_sprite;
    indicator.image_blend = indicator_color;
    indicator.offset_x = indicator_offset_x; // Pass offset to indicator
    indicator.offset_y = indicator_offset_y; // Pass offset to indicator
    
    show_debug_message("Created effect indicator at offset: " + string(indicator_offset_x) + ", " + string(indicator_offset_y));
}

// Hide gift
visible = false;
image_alpha = 0;

// Set respawn timer
alarm[0] = 15 * room_speed;
show_debug_message("Gift collected. Will respawn in 15 seconds");