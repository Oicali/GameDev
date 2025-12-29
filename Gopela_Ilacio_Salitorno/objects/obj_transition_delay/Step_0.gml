timer += 1;

// After logo fades (5 seconds = 300 frames)
if (timer > 300) {
    // Activate buttons
    instance_activate_object(obj_button_start);
    instance_activate_object(obj_button_howtoplay);
    instance_activate_object(obj_button_exit);
    
    // Create transition
    if (!instance_exists(obj_transition)) {
        instance_create_depth(0, 0, -10000, obj_transition);
    }
    
    instance_destroy();
}