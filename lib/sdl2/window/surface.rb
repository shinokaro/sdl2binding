require_relative '../surface'

module SDL2
  class Window
    module Surface
      def surface
        # SDL_GetWindowSurface 関数は呼び出される度に Window に変更があったか判定する。
        # Window の変更が検知されると既存の Surface を開放し、新しい Surface を生成する。
        # 戻り値の Surface には SDL_DONTFREE フラグがセットされている。
        # このため SDL_FreeSurface 関数を使用しても安全である。
        surface = SDL2.SDL_GetWindowSurface(window)
        raise Error if surface == Fiddle::NULL
        SDL2::Surface.new(surface)
      end

      def update_window_surface
        error = SDL2.SDL_UpdateWindowSurface(window)
        raise Error if error < 0
        self
      end

      alias update update_window_surface

      def update_window_surface_rects(rects)
        error = SDL2.SDL_UpdateWindowSurfaceRects(window, rects. rects.size)
        raise Error if error < 0
        self
      end
    end
  end
end
