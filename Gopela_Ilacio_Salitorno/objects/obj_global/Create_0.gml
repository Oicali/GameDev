/// @description Initialize globals
randomize();
if (!variable_global_exists("mouse_score")) {
    global.mouse_score = 0;
}
if (!variable_global_exists("cat_score")) {
    global.cat_score = 0;
}
if (!variable_global_exists("round")) {
    global.round = 1;
}
if (!variable_global_exists("mouse_cheese_collected")) {
    global.mouse_cheese_collected = 0;
}
// ADD THIS FLAG:
if (!variable_global_exists("teleported_by_gift")) {
    global.teleported_by_gift = false;
}

if (!variable_global_exists("saved_timer")) {
    global.saved_timer = 81; // Default timer value
}

persistent = true;