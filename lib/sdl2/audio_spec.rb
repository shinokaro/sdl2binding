require 'forwardable'

module SDL2
  class AudioSpec
    extend Forwardable

    def_delegators :@spec, :freq, :format, :channels, :to_i

    def initialize(freq: 0, format: 0, channels: 0)
      spec = SDL_AudioSpec.malloc
      spec.freq     = freq
      spec.format   = AudioFormat.new(format)
      spec.channels = channels
      spec.callback = nil
      spec.userdata = nil
      @spec = spec
    end
  end
end