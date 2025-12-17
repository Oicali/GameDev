/// @description Teleport Animation (Fixed)
if (is_teleporting) {
    teleport_timer += 1;
    
    // PHASE 1: Fade out (20 frames)
    if (teleport_phase == 1) {
        image_alpha -= 0.05;  // Fade out
        image_xscale -= 0.03;  // Shrink
        image_yscale -= 0.03;
        
        if (teleport_timer >= 20) {
            // Move to new position instantly
            x = target_x;
            y = target_y;
            
            // Start fade in immediately
            teleport_phase = 3;
            teleport_timer = 0;
            image_alpha = 0;
            image_xscale = 0;
            image_yscale = 0;
        }
    }
    
    // PHASE 3: Fade in (20 frames)
    else if (teleport_phase == 3) {
        image_alpha += 0.05;  // Fade in
        image_xscale += 0.03;  // Grow
        image_yscale += 0.03;
        
        if (teleport_timer >= 20) {
            // Finished - back to normal
            image_alpha = 1;
            image_xscale = 0.6;
            image_yscale = 0.6;
            is_teleporting = false;
            teleport_phase = 0;
            teleport_timer = 0;
        }
    }
}