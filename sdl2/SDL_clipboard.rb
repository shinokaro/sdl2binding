module SDL2
  module SDL_Clipboard
    #
    # SDL_clipboard.h
    #
    def included(m)
      m.module_eval {
        extern "int       SDL_SetClipboardText(const char *text)"
        extern "char     *SDL_GetClipboardText(void)"
        extern "SDL_bool  SDL_HasClipboardText(void)"
      }
    end
    module_function :included
  end
end
