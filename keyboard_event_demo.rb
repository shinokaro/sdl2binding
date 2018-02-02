require_relative './lib/sdl2'
SDL2.init

window = SDL2::Window.new
loop do
  event = SDL2::Event.wait

  if SDL2::EventType::KeyUp === event
    p "#{event.timestamp}"
  end

  if SDL2::KeyboardEvent === event
    p "#{event.timestamp}"
  end
end