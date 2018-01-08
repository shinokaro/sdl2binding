require_relative './sdl2'

# SOUND DEMO
SDL2.SDL_Init(SDL2::SDL_INIT_EVERYTHING)
path = '' # your wave file
desired = SDL2::SDL_AudioSpec.malloc.tap { |spec|
  spec.freq     = 48_000
  spec.format   = SDL2::AUDIO_S16LSB
  spec.channels = 2
  spec.silence  = 0
  spec.samples  = 0
  spec.padding  = 0
  spec.size     = 0
  spec.callback = nil
  spec.userdata = nil
}
obtained = SDL2::SDL_AudioSpec.malloc
dev = SDL2.SDL_OpenAudioDevice(nil, 0, desired, obtained, 0)
raise "#{SDL2.SDL_GetError}" if dev == 0
file = File.open(path, "rb")

SDL2.SDL_PauseAudioDevice(dev, 0)

1000.times do
  data = file.read(48_000 * 4)
  exit unless data
  res = SDL2.SDL_QueueAudio(dev, data, data.size)
  raise "#{SDL2.SDL_GetError}" if res < 0
  p "QUE SIZE: #{SDL2.SDL_GetQueuedAudioSize(dev)}"
  sleep 1
end
