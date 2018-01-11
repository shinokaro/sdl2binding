require_relative './lib/sdl2'

# SOUND DEMO
SDL2.SDL_Init(SDL2::SDL_INIT_EVERYTHING)
file_path = '' # your wave file

spec      = Fiddle::Pointer.malloc(SDL2::SDL_AudioSpec.size)
audio_buf = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INTPTR_T)
audio_len = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
audio_spec = SDL2::SDL_LoadWAV[file_path, spec, audio_buf, audio_len]
raise "#{SDL2.SDL_GetError}" if audio_spec.to_i == 0

desired = SDL2::SDL_AudioSpec.new(spec)
obtained = SDL2::SDL_AudioSpec.malloc
dev = SDL2.SDL_OpenAudioDevice(nil, 0, desired, obtained, 0)
raise "#{SDL2.SDL_GetError}" if dev == 0
file = File.open(file_path, "rb")

SDL2.SDL_PauseAudioDevice(dev, 0)
sample_rate = desired.freq
byte_rate = sample_rate * 4
duration = 0.125
loop do
  queue_size = SDL2.SDL_GetQueuedAudioSize(dev)
  if queue_size < byte_rate
    fetch_size = sample_rate * 4
    data = file.read(fetch_size)
    break unless data
    res = SDL2.SDL_QueueAudio(dev, data, data.size)
    raise "#{SDL2.SDL_GetError}" if res < 0
    p "QUE SIZE: #{SDL2.SDL_GetQueuedAudioSize(dev)}"
  end

  sleep duration
end
