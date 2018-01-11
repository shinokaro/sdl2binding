module SDL2
  #
  # SDL_touch.h
  #
  require_relative 'SDL_stdinc'

  typealias 'SDL_TouchID', 'Sint64'
  typealias 'SDL_FingerID', 'Sint64'

  SDL_Finger = struct([
                          'SDL_FingerID id',
                          'float x',
                          'float y',
                          'float pressure'
                      ])
  typealias 'SDL_Finger', 'void*'

  # Used as the device ID for mouse events simulated with touch input
  SDL_TOUCH_MOUSEID = (0xFFFF_FFFF) # ((Uint32) -1)

  extern 'int          SDL_GetNumTouchDevices(void)'
  extern 'SDL_TouchID  SDL_GetTouchDevice(int index)'
  extern 'int          SDL_GetNumTouchFingers(SDL_TouchID touchID)'
  extern 'SDL_Finger  *SDL_GetTouchFinger(SDL_TouchID touchID, int index)'
end