/// @description Insert description here
// You can write your code in this editor

// Destroy old digits
with (obj_timer_digit) {
    instance_destroy();
}

with (obj_timer_colon) {
    instance_destroy();
}

// Calculate time
var minutes = floor(time_remaining / 60);
var seconds = time_remaining mod 60;

// Get individual digits
var min_tens = floor(minutes / 10);
var min_ones = minutes mod 10;
var sec_tens = floor(seconds / 10);
var sec_ones = seconds mod 10;

// Starting position (centers the timer)
var start_x = timer_x - (spacing * 2);

// Create minute tens digit (e.g., "0" in "02:00")
var d1 = instance_create_layer(start_x, timer_y, "Instances", obj_timer_digit);
d1.digit_value = min_tens;
d1.image_xscale = number_scale;
d1.image_yscale = number_scale;

// Create minute ones digit (e.g., "2" in "02:00")
var d2 = instance_create_layer(start_x + spacing, timer_y, "Instances", obj_timer_digit);
d2.digit_value = min_ones;
d2.image_xscale = number_scale;
d2.image_yscale = number_scale;

// Create colon (:)
var col = instance_create_layer(start_x + spacing * 2, timer_y, "Instances", obj_timer_colon);
col.image_xscale = number_scale;
col.image_yscale = number_scale;

// Create second tens digit (e.g., "0" in "02:00")
var d3 = instance_create_layer(start_x + spacing * 3, timer_y, "Instances", obj_timer_digit);
d3.digit_value = sec_tens;
d3.image_xscale = number_scale;
d3.image_yscale = number_scale;

// Create second ones digit (e.g., "0" in "02:00")
var d4 = instance_create_layer(start_x + spacing * 4, timer_y, "Instances", obj_timer_digit);
d4.digit_value = sec_ones;
d4.image_xscale = number_scale;
d4.image_yscale = number_scale;