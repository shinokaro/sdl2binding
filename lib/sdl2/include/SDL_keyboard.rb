module SDL2
  #
  # SDL_keyboard.h
  #
  require_relative 'SDL_stdinc'
  require_relative 'SDL_keycode'

  const_set :SDL_Keysym, struct([
      'SDL_Scancode scancode', # SDL physical key code - see ::SDL_Scancode for details
      'SDL_Keycode sym',       # SDL virtual key code - see ::SDL_Keycode for details
      'Uint16 mod',            # current key modifiers
      'Uint32 unused'
  ])
  typealias 'SDL_Keysym', 'void*'

  extern 'SDL_Window  *SDL_GetKeyboardFocus(void);'
  extern 'const Uint8 *SDL_GetKeyboardState(int *numkeys);'
  extern 'SDL_Keymod   SDL_GetModState(void);'
  extern 'void         SDL_SetModState(SDL_Keymod modstate);'
  extern 'SDL_Keycode  SDL_GetKeyFromScancode(SDL_Scancode scancode);'
  extern 'SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode key);'
  extern 'const char  *SDL_GetScancodeName(SDL_Scancode scancode);'
  extern 'SDL_Scancode SDL_GetScancodeFromName(const char *name);'
  extern 'const char  *SDL_GetKeyName(SDL_Keycode key);'
  extern 'SDL_Keycode  SDL_GetKeyFromName(const char *name);'
  extern 'void     SDL_StartTextInput(void);'
  extern 'SDL_bool SDL_IsTextInputActive(void);'
  extern 'void     SDL_StopTextInput(void);'
  extern 'void     SDL_SetTextInputRect(SDL_Rect *rect);'
  extern 'SDL_bool SDL_HasScreenKeyboardSupport(void);'
  extern 'SDL_bool SDL_IsScreenKeyboardShown(SDL_Window *window);'
end
