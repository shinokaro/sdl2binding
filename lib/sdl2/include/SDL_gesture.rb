module SDL2
  #
  # SDL_gesture.h
  #
  require_relative 'SDL_stdinc'
  require_relative 'SDL_touch'

  typealias 'SDL_GestureID', 'Sint64'

  extern 'int SDL_RecordGesture(SDL_TouchID touchId)'
  extern 'int SDL_SaveAllDollarTemplates(SDL_RWops *dst)'
  extern 'int SDL_SaveDollarTemplate(SDL_GestureID gestureId, SDL_RWops *dst)'
  extern 'int SDL_LoadDollarTemplates(SDL_TouchID touchId, SDL_RWops *src)'
end