module SDL2
  class Video
    class << self
      def current_driver
        char = SDL2.SDL_GetCurrentVideoDriver
        (char == Fiddle::NULL) ? nil : char.to_s
      end

      def num_drivers
        num = SDL2.SDL_GetNumVideoDrivers
        raise Error, error_msg if num < 0
        num
      end

      def drivers
        num_drivers.times.map { |i| new(i) }
      end
    end

    def initialize(index)
      @index ||= index
    end

    attr_reader :index

    def name
      char = SDL2.SDL_GetVideoDriver(@index)
      (char == Fiddle::NULL) ? nil : char.to_s
    end

    alias to_s name
  end
end