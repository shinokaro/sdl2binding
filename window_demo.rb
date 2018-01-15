require_relative './lib/sdl2'

window = SDL2::Window.new

window.minimum_size = [10, 10]
p window.minimum_size
window.position = []
p window.position
window.opacity= 0.5
p m = window.window_gamma_ramp
window.window_gamma_ramp = m
p SDL2::Window.display_name(0)
SDL2::Window.display_mode(0, 0).tap { |display_mode|
  p display_mode.format
  p display_mode.w
  p display_mode.h
  p display_mode.refresh_rate
  p display_mode.pixel_type
  p display_mode.pixel_order
  p display_mode.pixel_layout
  p display_mode.bits_per_pixel
  p display_mode.bytes_per_pixel
  p display_mode.indexed?
  p display_mode.alpha?
  p display_mode.fourcc?
}
window.hit_test {
  p :hit
}
loop {}