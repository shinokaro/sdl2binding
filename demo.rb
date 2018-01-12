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
dev = SDL2::AudioDevice.new(freq: desired.freq, format: desired.format, channels: desired.channels)

file = File.open(file_path, "rb")

dev.play
sample_rate = dev.freq
byte_rate = sample_rate * 4
duration = 0.125

loop do
  queue_size = dev.queued_audio_size
  if queue_size < byte_rate
    p "QUE SIZE: #{queue_size}"
    fetch_size = sample_rate * 4
    data = file.read(fetch_size)
    break unless data
    dev << data
  end

  sleep duration
end
