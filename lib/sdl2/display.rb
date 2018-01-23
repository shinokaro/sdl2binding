require_relative 'pointer'

module SDL2
  class Display
    class << self
      def num
        num = SDL2.SDL_GetNumVideoDisplays
        raise Error if num < 0
        num
      end

      alias count num
    end

    def initialize(index = 0)
      raise Error, 'Display does not exist.' if self.class.count == 0
      @index = index
    end

    attr_reader :index

    alias to_i index

    def name
      char = SDL2.SDL_GetDisplayName(@index)
      raise Error if char == Fiddle::NULL
      char.to_s
    end

    alias to_s name

    def bounds
      rect = Rect.new
      error = SDL2.SDL_GetDisplayBounds(@index, rect)
      raise Error if error < 0
      rect
    end

    def usable_bounds
      rect = Rect.new
      error = SDL2.SDL_GetDisplayUsableBounds(@index, rect)
      raise Error if error < 0
      rect
    end

    def dpi
      ddpi, hdpi, vdpi = FloatPointer.new, FloatPointer.new, FloatPointer.new
      error = SDL2.SDL_GetDisplayDPI(@index, ddpi, hdpi, vdpi)
      raise Error if error < 0
      [ddpi.value, hdpi.value, vdpi.value]
    end

    def num_modes
      num = SDL2.SDL_GetNumDisplayModes(@index)
      raise Error if num < 0
      num
    end

    def display_mode(mode_index)
      mode = DisplayMode.new
      error = SDL2.SDL_GetDisplayMode(@index, mode_index, mode)
      raise Error if error < 0
      mode
    end

    def modes
      num_modes.times.map { |i| self.class.new(i) }
    end

    def desktop_mode
      mode = DisplayMode.new
      error = SDL2.SDL_GetDesktopDisplayMode(@index, mode)
      raise Error if error < 0
      mode
    end

    def current_mode
      mode = DisplayMode.new
      error = SDL2.SDL_GetCurrentDisplayMode(@index, mode)
      raise Error if error < 0
      mode
    end

    def closest_mode(mode)
      closest = DisplayMode.malloc
      error = SDL2.SDL_GetClosestDisplayMode(@index, mode, closest)
      raise Error if error == Fiddle::NULL
      closest
    end
  end
end