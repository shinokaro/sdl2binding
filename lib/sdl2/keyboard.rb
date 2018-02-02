module SDL2
  module Keyboard
    def mod_state
      Keymod.new(SDL2.SDL_GetModState)
    end

    def mod_state=(mod_state)
      SDL2.SDL_SetModState(mod_state)
    end

    def keyboard_focus
      window_ptr = SDL2.SDL_GetKeyboardFocus
    end

    def keyboard_state
      # 最新の情報を得るには pump_event が必要
      num_keys = IntPointer.new
      state = SDL2.SDL_GetKeyboardState(num_keys)
      state.to_str(num_keys.value).unpack('C*').map! { |i| i != 0 }
    end

    def text_input=(start)
      start ? SDL2.SDL_StartTextInput : SDL2.SDL_StopTextInput
    end

    def text_input?
      SDL_bool[SDL2.SDL_IsTextInputActive]
    end

    def test_input_rect=(rect)
      SDL2.SDL_SetTextInputRect(rect)
    end

    def screen_keyboard_support?
      SDL_bool[SDL2.SDL_HasScreenKeyboardSupport]
    end

    def screen_keyboard_shown(window)
      # Window 側にこれを利用するメソッドを用意
      SDL_bool[SDL2.SDL_IsScreenKeyboardShown(window)]
    end
  end
end
