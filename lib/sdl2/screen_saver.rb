module SDL2
  module ScreenSaver
    def enable
      SDL2.SDL_EnableScreenSaver
    end

    def enable?
      SDL_bool[SDL2.SDL_IsScreenSaverEnabled]
    end

    def disable
      SDL2.SDL_DisableScreenSaver
    end

    def disable?
      !enable?
    end
  end
end
