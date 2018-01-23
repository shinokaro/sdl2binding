module SDL2
  module Clipboard
    def clipboard_text=(text)
      error = SDL2.SDL_SetClipboardText(text)
      raise Error if error < 0
    end
    module_function :clipboard_text=

    def clipboard_text
      char = SDL2.SDL_GetClipboardText
      raise Error if char == Fiddle::NULL
      test = char.to_s
      SDL2.SDL_free(char)
      test
    end
    module_function :clipboard_text

    def clipboard_text?
      SDL_bool[SDL2.SDL_HasClipboardText]
    end
    module_function :clipboard_text?
  end
end
