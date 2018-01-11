module SDL2
  #
  # SDL_joystick.h
  #
  require_relative 'SDL_stdinc'

  typealias 'SDL_Joystick', 'void*'

  SDL_JoystickGUID = struct(['Uint8 data[16]'])
  typealias 'SDL_JoystickGUID', 'void*'

  typealias 'SDL_JoystickID', 'Sint32'

  # Enum: SDL_JoystickType
  SDL_JOYSTICK_TYPE_UNKNOWN        = 0
  SDL_JOYSTICK_TYPE_GAMECONTROLLER = 1
  SDL_JOYSTICK_TYPE_WHEEL          = 2
  SDL_JOYSTICK_TYPE_ARCADE_STICK   = 3
  SDL_JOYSTICK_TYPE_FLIGHT_STICK   = 4
  SDL_JOYSTICK_TYPE_DANCE_PAD      = 5
  SDL_JOYSTICK_TYPE_GUITAR         = 6
  SDL_JOYSTICK_TYPE_DRUM_KIT       = 7
  SDL_JOYSTICK_TYPE_ARCADE_PAD     = 8
  SDL_JOYSTICK_TYPE_THROTTLE       = 9
  typealias 'SDL_JoystickType', 'int'

  # Enum: SDL_JoystickPowerLevel
  SDL_JOYSTICK_POWER_UNKNOWN = -1
  SDL_JOYSTICK_POWER_EMPTY   = 0
  SDL_JOYSTICK_POWER_LOW     = 1
  SDL_JOYSTICK_POWER_MEDIUM  = 2
  SDL_JOYSTICK_POWER_FULL    = 3
  SDL_JOYSTICK_POWER_WIRED   = 4
  SDL_JOYSTICK_POWER_MAX     = 5
  typealias 'SDL_JoystickPowerLevel', 'int'

  extern 'void SDL_LockJoysticks(void)'
  extern 'void SDL_UnlockJoysticks(void)'
  extern 'int SDL_NumJoysticks(void)'
  extern 'const char *SDL_JoystickNameForIndex(int device_index)'
  extern 'SDL_JoystickGUID SDL_JoystickGetDeviceGUID(int device_index)'
  extern 'Uint16 SDL_JoystickGetDeviceVendor(int device_index)'
  extern 'Uint16 SDL_JoystickGetDeviceProduct(int device_index)'
  extern 'Uint16 SDL_JoystickGetDeviceProductVersion(int device_index)'
  extern 'SDL_JoystickType SDL_JoystickGetDeviceType(int device_index)'
  extern 'SDL_JoystickID SDL_JoystickGetDeviceInstanceID(int device_index)'
  extern 'SDL_Joystick *SDL_JoystickOpen(int device_index)'
  extern 'SDL_Joystick *SDL_JoystickFromInstanceID(SDL_JoystickID joyid)'
  extern 'const char *SDL_JoystickName(SDL_Joystick * joystick)'
  extern 'SDL_JoystickGUID SDL_JoystickGetGUID(SDL_Joystick * joystick)'
  extern 'Uint16 SDL_JoystickGetVendor(SDL_Joystick * joystick)'
  extern 'Uint16 SDL_JoystickGetProduct(SDL_Joystick * joystick)'
  extern 'Uint16 SDL_JoystickGetProductVersion(SDL_Joystick * joystick)'
  extern 'SDL_JoystickType SDL_JoystickGetType(SDL_Joystick * joystick)'
  extern 'void SDL_JoystickGetGUIDString(SDL_JoystickGUID guid, char *pszGUID, int cbGUID)'
  extern 'SDL_JoystickGUID SDL_JoystickGetGUIDFromString(const char *pchGUID)'
  extern 'SDL_bool SDL_JoystickGetAttached(SDL_Joystick * joystick)'
  extern 'SDL_JoystickID SDL_JoystickInstanceID(SDL_Joystick * joystick)'
  extern 'int SDL_JoystickNumAxes(SDL_Joystick * joystick)'
  extern 'int SDL_JoystickNumBalls(SDL_Joystick * joystick)'
  extern 'int SDL_JoystickNumHats(SDL_Joystick * joystick)'
  extern 'int SDL_JoystickNumButtons(SDL_Joystick * joystick)'
  extern 'void SDL_JoystickUpdate(void)'
  extern 'int SDL_JoystickEventState(int state)'

  SDL_JOYSTICK_AXIS_MAX = 32767
  SDL_JOYSTICK_AXIS_MIN = -32768

  extern 'Sint16 SDL_JoystickGetAxis(SDL_Joystick * joystick, int axis)'
  extern 'SDL_bool SDL_JoystickGetAxisInitialState(SDL_Joystick * joystick, int axis, Sint16 *state)'

  SDL_HAT_CENTERED  = 0x00
  SDL_HAT_UP        = 0x01
  SDL_HAT_RIGHT     = 0x02
  SDL_HAT_DOWN      = 0x04
  SDL_HAT_LEFT      = 0x08
  SDL_HAT_RIGHTUP   = (SDL_HAT_RIGHT | SDL_HAT_UP)
  SDL_HAT_RIGHTDOWN = (SDL_HAT_RIGHT | SDL_HAT_DOWN)
  SDL_HAT_LEFTUP    = (SDL_HAT_LEFT | SDL_HAT_UP)
  SDL_HAT_LEFTDOWN  = (SDL_HAT_LEFT | SDL_HAT_DOWN)

  extern 'Uint8 SDL_JoystickGetHat(SDL_Joystick * joystick, int hat)'
  extern 'int SDL_JoystickGetBall(SDL_Joystick * joystick, int ball, int *dx, int *dy)'
  extern 'Uint8 SDL_JoystickGetButton(SDL_Joystick * joystick, int button)'
  extern 'void SDL_JoystickClose(SDL_Joystick * joystick)'
  extern 'SDL_JoystickPowerLevel SDL_JoystickCurrentPowerLevel(SDL_Joystick * joystick)'
end
