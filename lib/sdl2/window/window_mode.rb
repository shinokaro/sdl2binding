module SDL2
  class Window
    module WindowMode
      def fullscreen
        error = SDL2.SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN)
        raise Error if error < 0
      end

      def fullscreen_desktop
        error = SDL2.SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN_DESKTOP)
        raise Error if error < 0
      end

      def window_mode
        error = SDL2.SDL_SetWindowFullscreen(window, 0)
        raise Error if error < 0
      end
    end
  end
end
