module SDL2
  class AudioDriver
    class << self
      def current
        char = SDL2.SDL_GetCurrentAudioDriver
        (char == Fiddle::NULL) ? nil : char.to_s
      end

      def num
        SDL2.SDL_GetNumAudioDrivers
      end

      def drivers
        num.times.map { |i| new(i) }
      end
    end

    def initialize(index)
      @index = index
    end

    attr_reader :index

    alias to_i index

    def name
      char = SDL2.SDL_GetAudioDriver(@index)
      (char == Fiddle::NULL) ? nil : char.to_s
    end

    alias to_s name
  end
end
