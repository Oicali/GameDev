// Force correct window and display size
surface_resize(application_surface, 1280, 720);
window_set_size(1280, 720);
window_center();

// Disable any automatic scaling
display_reset(0, false);

// Disable texture interpolation for crisp graphics
gpu_set_tex_filter(false);