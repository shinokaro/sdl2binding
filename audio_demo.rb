require_relative './lib/sdl2'

# SOUND DEMO
SDL2.init

file_path = '' # your wave file
wave = SDL2::Audio.load(file_path)
dev = SDL2::Audio.output_devices.first.open(**wave)

file = StringIO.new(wave.data, "rb")

dev.play
sample_rate = dev.freq
byte_rate = sample_rate * 4
duration = 0.125

loop do
  queue_size = dev.queued_size
  if queue_size < byte_rate
    p "QUE SIZE: #{queue_size}"
    fetch_size = sample_rate * 4
    data = file.read(fetch_size)
    break unless data
    dev << data
  end

  sleep duration
end
SDL2.quit
