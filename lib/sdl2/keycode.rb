module SDL2
  class Keycode
    class << self
      def from_scancode(scancode)
        new(SDL2.SDL_GetKeyFromScancode(scancode))
      end

      def from_name(name)
        keycode = SDL2.SDL_GetKeyFromName(name)
        raise Error if keycode == SDLK_UNKNOWN
        new(keycode)
      end
    end

    def initialize(keycode)
      @keycode = keycode
    end

    attr_reader :keycode

    alias to_i keycode

    def to_scancode
      Scancode.from_keycode(self)
    end

    def name
      SDL2.SDL_GetKeyName(@keycode).to_s.force_encoding('UTF-8')
    end

    alias to_s name
  end
end
