require_relative './lib/sdl2'
window = SDL2::Window.new

# a = SDL2::Surface.create_surface(100, 100)
# a.free
# p a.alpha_mod
# exit

surface = window.surface #=> WindowSurfaceが返るべき?
window.w = 100
window.destroy
# b = window.surface
surface.fill_rect(SDL2::Rect.new(w:100, h:100), 0x00ff00ff)
# b.fill_rect(SDL2::Rect.new(w:100, h:100), 0x00ffffff)
window.update

window.minimum_size = [10, 10]
p window.minimum_size
window.position = []
p window.position
p window.window_gamma_ramp
p window.grab
window.opacity= 0.5
window.display.current_mode.tap { |display_mode|
  p display_mode.w
  p display_mode.h
  p display_mode.refresh_rate
  format = display_mode.format
  p format.name
  p format.type_name
  p format.order_name
  p format.layout_name
  p format.bits
  p format.bytes
  p format.indexed?
  p format.alpha?
  p format.four_cc?
}
window.hit_test {
  p :hit
}
p "TEST"
p i = window.window_id
w2 = SDL2::Window.window_from_id i
w2.x = 0
p w2.window_id
# w2.destroy
# window.destroy
loop {}