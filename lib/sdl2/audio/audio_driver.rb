module SDL2
  class Audio
    class AudioDriver
      class << self
        def current
          char = SDL2.SDL_GetCurrentAudioDriver
          (Fiddle::NULL == char) ? nil : char.to_s
        end

        def count
          SDL2.SDL_GetNumAudioDrivers
        end

        def drivers
          count.times.map { |i| new(i) }
        end
      end

      def initialize(index)
        @index = index
      end

      attr_reader :index

      alias to_i index

      def name
        char = SDL2.SDL_GetAudioDriver(index)
        (Fiddle::NULL == char) ? nil : char.to_s
      end

      alias to_s name
    end
  end
end
