module SDL2
  class Scancode
    class << self
      def from_keycode(keycode)
        new(SDL2.SDL_GetScancodeFromKey(keycode))
      end

      def form_name(name)
        scancode = SDL2.SDL_GetScancodeFromName(name)
        raise Error if scancode == SDL_SCANCODE_UNKNOWN
        new(scancode)
      end
    end

    def initialize(scancode)
      @scancode = scancode
    end

    attr_reader :scancode

    alias to_i scancode

    def to_key
      Keycode.from_scancode(self)
    end

    def name
      SDL2.SDL_GetScancodeName(@scancode).to_s
    end

    alias to_s name
  end
end
