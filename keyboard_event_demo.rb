require_relative './lib/sdl2'
SDL2.init
f = SDL2::EventFilter::Callback.new { |e| p e; true }
SDL2::EventFilter.instance.monitor= f
window = SDL2::Window.new
loop do
  event = SDL2::Event.wait

  if SDL2::DropEvent === event
    p event.type, event.filename
  end

  if SDL2::TextEditingEvent === event
    p "#{event.text}, #{event.length}"
  end
  if SDL2::TextInputEvent === event
    p event.text
  end
  if SDL2::EventType::KeyUp === event
    p "#{event.timestamp}"
  end

  if SDL2::KeyboardEvent === event
    p "#{event.timestamp}"
  end
end