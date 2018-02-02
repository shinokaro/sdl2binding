module SDL2
  module Mouse
    def mouse_focus
      _SDL_Window = SDL2.SDL_GetMouseFocus
    end

    def mouse_state
      x = IntPointer.new
      y = IntPointer.new
      buttons = SDL2.SDL_GetMouseState(x, y)
      [buttons, x.value, y.value]
      # SDL_BUTTON        = -> (x) { (1 << (x - 1)) }
      # ボタンのためのクラスが必要、マウスクラスも考えるべき。
    end

    def global_mouse_state
      x = IntPointer.new
      y = IntPointer.new
      buttons = SDL2.SDL_GetGlobalMouseState(x, y)
      [buttons, x.value, y.value]
    end

    def relative_mouse_state
      x = IntPointer.new
      y = IntPointer.new
      buttons = SDL2.SDL_GetRelativeMouseState(x, y)
      [buttons, x.value, y.value]
    end

    def warp_mouse_in_window(window, x, y)
      SDL2.SDL_WarpMouseInWindow(window, x, y)
    end

    def warp_mouse_global(x, y)
      error = SDL2.SDL_WarpMouseGlobal(x, y)
      raise Error if error < 0
    end

    def capture_mouse(enabled)
      error = SDL2.SDL_CaptureMouse(enabled ? 1 : 0)
      raise Error if error < 0
    end

    def relative_mouse_mode=(enabled)
      error = SDL2.SDL_SetRelativeMouseMode(enabled ? 1 : 0)
      raise Error if error < 0
    end
    def relative_mouse_mode
      SDL_bool[SDL2.SDL_GetRelativeMouseMode]
    end
  end
end
module SDL2
  module MouseCursor
    SDL_SYSTEM_CURSOR_ARROW     = 0  # Arrow
    SDL_SYSTEM_CURSOR_IBEAM     = 1  # I-beam
    SDL_SYSTEM_CURSOR_WAIT      = 2  # Wait
    SDL_SYSTEM_CURSOR_CROSSHAIR = 3  # Crosshair
    SDL_SYSTEM_CURSOR_WAITARROW = 4  # Small wait cursor (or Wait if not available)
    SDL_SYSTEM_CURSOR_SIZENWSE  = 5  # Double arrow pointing northwest and southeast
    SDL_SYSTEM_CURSOR_SIZENESW  = 6  # Double arrow pointing northeast and southwest
    SDL_SYSTEM_CURSOR_SIZEWE    = 7  # Double arrow pointing west and east
    SDL_SYSTEM_CURSOR_SIZENS    = 8  # Double arrow pointing north and south
    SDL_SYSTEM_CURSOR_SIZEALL   = 9  # Four pointed arrow pointing north, south, east, and west
    SDL_SYSTEM_CURSOR_NO        = 10 # Slashed circle or crossbones
    SDL_SYSTEM_CURSOR_HAND      = 11 # Hand

    # typealias 'SDL_Cursor', 'void*' # Implementation dependent
    # 使用中のカーソルを開放したらどうなるのか？　クラスを作るかの判断ポイント

    def create_cursor(data, mask, w, h, hot_x = 0, hot_y = 0)
      # const Uint8 * data, const Uint8 * mask
      cursor = SDL2.SDL_CreateCursor(data, mask, w, h, hot_x, hot_y)
      raise Error if cursor == Fiddle::NULL
      cursor
    end

    def create_color_cursor(surface, hot_x = 0, hot_y = 0)
      cursor = SDL2.SDL_CreateColorCursor(surface, hot_x, hot_y)
      raise Error if cursor == Fiddle::NULL
      cursor
    end

    def create_system_cursor(id)
      cursor = SDL2.SDL_CreateSystemCursor(id)
      raise Error if cursor == Fiddle::NULL
      cursor
    end

    def set_cursor(cursor)
      SDL2.SDL_SetCursor(cursor)
    end

    def get_cursor
      cursor = SDL2.SDL_GetCursor
      # null is no-mouse
    end

    def get_default_cursor
      cousor =  SDL2.SDL_GetDefaultCursor
      # null is fail
    end

    def free_cursor(cursor)
      SDL2.SDL_FreeCursor(cursor)
    end

    def show_cursor(toggle)
      # toggle = SDL_QUERY, SDL_DISABLE or SDL_ENABLE
      state = SDL2.SDL_ShowCursor(toggle)
      raise Error if state == Fiddle::NULL
      state
    end
  end
end
