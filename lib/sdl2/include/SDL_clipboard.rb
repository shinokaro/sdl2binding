module SDL2
  #
  # SDL_clipboard.h
  #
  require_relative 'SDL_stdinc'

  extern "int       SDL_SetClipboardText(const char *text)"
  extern "char     *SDL_GetClipboardText(void)"
  extern "SDL_bool  SDL_HasClipboardText(void)"
end
