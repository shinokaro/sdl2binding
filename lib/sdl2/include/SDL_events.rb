module SDL2
  #
  # SDL_events.h
  #
  require_relative 'SDL_stdinc'
  #include "SDL_video"
  require_relative 'SDL_keyboard'
  require_relative 'SDL_mouse'
  require_relative 'SDL_joystick'
  #include "SDL_gamecontroller"
  #include "SDL_quit"
  require_relative 'SDL_gesture'
  require_relative 'SDL_touch'

  SDL_RELEASED = 0
  SDL_PRESSED  = 1
  SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32
  SDL_TEXTINPUTEVENT_TEXT_SIZE   = 32

  # Enum; SDL_EventType
  const_set :SDL_FIRSTEVENT,              0     # Unused (do not remove)
  #
  # Application events
  #
  const_set :SDL_QUIT,                    0x100 # User-requested quit
                                                # These application events have special meaning on iOS, see README-ios.md for details
                                                #
  const_set :SDL_APP_TERMINATING,         0x101 # The application is being terminated by the OS
                                                #    Called on iOS in applicationWillTerminate()
                                                #    Called on Android in onDestroy()
                                                #
  const_set :SDL_APP_LOWMEMORY,           0x102 # The application is low on memory, free memory if possible.
                                                #    Called on iOS in applicationDidReceiveMemoryWarning()
                                                #    Called on Android in onLowMemory()
                                                #
  const_set :SDL_APP_WILLENTERBACKGROUND, 0x103 # The application is about to enter the background
                                                # Called on iOS in applicationWillResignActive()
                                                # Called on Android in onPause()
                                                #
  const_set :SDL_APP_DIDENTERBACKGROUND,  0x104 # The application did enter the background and may not get CPU for some time
                                                # Called on iOS in applicationDidEnterBackground()
                                                # Called on Android in onPause()
                                                #
  const_set :SDL_APP_WILLENTERFOREGROUND, 0x105 # The application is about to enter the foreground
                                                # Called on iOS in applicationWillEnterForeground()
                                                # Called on Android in onResume()
                                                #
  const_set :SDL_APP_DIDENTERFOREGROUND,  0x106 # The application is now interactive
                                                # Called on iOS in applicationDidBecomeActive()
                                                # Called on Android in onResume()
                                                #
  #
  # Window events
  #
  const_set :SDL_WINDOWEVENT,             0x200 # Window state change
  const_set :SDL_SYSWMEVENT,              0x201 # System specific event
  #
  # Keyboard events
  #
  const_set :SDL_KEYDOWN,                 0x300 # Key pressed
  const_set :SDL_KEYUP,                   0x301 # Key released
  const_set :SDL_TEXTEDITING,             0x302 # Keyboard text editing (composition)
  const_set :SDL_TEXTINPUT,               0x303 # Keyboard text input
  const_set :SDL_KEYMAPCHANGED,           0x304 # Keymap changed due to a system event such as an
                                                # input language or keyboard layout change.
                                                #
  #
  # Mouse events
  #
  const_set :SDL_MOUSEMOTION,             0x400 # Mouse moved
  const_set :SDL_MOUSEBUTTONDOWN,         0x401 # Mouse button pressed
  const_set :SDL_MOUSEBUTTONUP,           0x402 # Mouse button released
  const_set :SDL_MOUSEWHEEL,              0x403 # Mouse wheel motion
  #
  # Joystick events
  #
  const_set :SDL_JOYAXISMOTION,           0x600 # Joystick axis motion
  const_set :SDL_JOYBALLMOTION,           0x601 # Joystick trackball motion
  const_set :SDL_JOYHATMOTION,            0x602 # Joystick hat position change
  const_set :SDL_JOYBUTTONDOWN,           0x603 # Joystick button pressed
  const_set :SDL_JOYBUTTONUP,             0x604 # Joystick button released
  const_set :SDL_JOYDEVICEADDED,          0x605 # A new joystick has been inserted into the system
  const_set :SDL_JOYDEVICEREMOVED,        0x606 # An opened joystick has been removed
  #
  # Game controller events
  #
  const_set :SDL_CONTROLLERAXISMOTION,     0x650 # Game controller axis motion
  const_set :SDL_CONTROLLERBUTTONDOWN,     0x651 # Game controller button pressed
  const_set :SDL_CONTROLLERBUTTONUP,       0x652 # Game controller button released
  const_set :SDL_CONTROLLERDEVICEADDED,    0x653 # A new Game controller has been inserted into the system
  const_set :SDL_CONTROLLERDEVICEREMOVED,  0x654 # An opened Game controller has been removed
  const_set :SDL_CONTROLLERDEVICEREMAPPED, 0x655 # The controller mapping was updated
  #
  # Touch events
  #
  const_set :SDL_FINGERDOWN,    0x700
  const_set :SDL_FINGERUP,      0x701
  const_set :SDL_FINGERMOTION,  0x702
  #
  # Gesture events
  #
  const_set :SDL_DOLLARGESTURE, 0x800
  const_set :SDL_DOLLARRECORD,  0x801
  const_set :SDL_MULTIGESTURE,  0x802
  #
  # Clipboard events
  #
  const_set :SDL_CLIPBOARDUPDATE, 0x900 # The clipboard changed
  #
  # Drag and drop events
  #
  const_set :SDL_DROPFILE,      0x1000 # The system requests a file open
  const_set :SDL_DROPTEXT,      0x1001 # text/plain drag-and-drop event
  const_set :SDL_DROPBEGIN,     0x1002 # A new set of drops is beginning (NULL filename)
  const_set :SDL_DROPCOMPLETE,  0x1003 # Current set of drops is now complete (NULL filename)
  #
  # Audio hotplug events
  #
  const_set :SDL_AUDIODEVICEADDED,   0x1100 # A new audio device is available
  const_set :SDL_AUDIODEVICEREMOVED, 0x1101 # An audio device has been removed.
  #
  # Render events
  #
  const_set :SDL_RENDER_TARGETS_RESET, 0x2000 # The render targets have been reset and their contents need to be updated
  const_set :SDL_RENDER_DEVICE_RESET,  0x2001 # The device has been reset and all textures need to be recreated
  #
  # Events ::SDL_USEREVENT through ::SDL_LASTEVENT are for your use,
  #  and should be allocated with SDL_RegisterEvents()
  #
  const_set :SDL_USEREVENT,   0x8000
  #
  #  This last event is only for bounding internal arrays
  #
  const_set :SDL_LASTEVENT,   0xFFFF
  #
  typealias 'SDL_EventType', 'int'

  const_set :SDL_CommonEvent, struct([
      'Uint32 type',
      'Uint32 timestamp'      # In milliseconds, populated using SDL_GetTicks()
  ])
  typealias 'SDL_CommonEvent', 'void*'

  const_set :SDL_WindowEvent, struct([
      'Uint32 type',          # ::SDL_WINDOWEVENT
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',      # The associated window
      'Uint8 event',          # ::SDL_WindowEventID
      'Uint8 padding1',
      'Uint8 padding2',
      'Uint8 padding3',
      'Sint32 data1',         # event dependent data
      'Sint32 data2'          # event dependent data
  ])
  typealias 'SDL_WindowEvent', 'void*'

  const_set :SDL_KeyboardEvent, struct([
      'Uint32 type',          # ::SDL_KEYDOWN or ::SDL_KEYUP
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',      # The window with keyboard focus, if any
      'Uint8 state',          # ::SDL_PRESSED or ::SDL_RELEASED
      'Uint8 repeat',         # Non-zero if this is a key repeat
      'Uint8 padding2',
      'Uint8 padding3',
      'SDL_Keysym keysym'     # The key that was pressed or released
  ])
  typealias 'SDL_KeyboardEvent', 'void*'

  const_set :SDL_TextEditingEvent, struct([
      'Uint32 type',                                # ::SDL_TEXTEDITING
      'Uint32 timestamp',                           # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',                            # The window with keyboard focus, if any
      "char text[#{SDL_TEXTEDITINGEVENT_TEXT_SIZE}]",  # The editing text
      'Sint32 start',                               # The start cursor of selected editing text
      'Sint32 length'                               # The length of selected editing text
  ])
  typealias 'SDL_TextEditingEvent', 'void*'

  const_set :SDL_TextInputEvent, struct([
      'Uint32 type',                                # ::SDL_TEXTINPUT
      'Uint32 timestamp',                           # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',                            # The window with keyboard focus, if any
      "char text[#{SDL_TEXTINPUTEVENT_TEXT_SIZE}]"  # The input text
  ])
  typealias 'SDL_TextInputEvent', 'void*'

  const_set :SDL_MouseMotionEvent, struct([
      'Uint32 type',          # ::SDL_MOUSEMOTION
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',      # The window with mouse focus, if any
      'Uint32 which',         # The mouse instance id, or SDL_TOUCH_MOUSEID
      'Uint32 state',         # The current button state
      'Sint32 x',             # X coordinate, relative to window
      'Sint32 y',             # Y coordinate, relative to window
      'Sint32 xrel',          # The relative motion in the X direction
      'Sint32 yrel'           # The relative motion in the Y direction
  ])
  typealias 'SDL_MouseMotionEvent', 'void*'

  const_set :SDL_MouseButtonEvent, struct([
      'Uint32 type',          # ::SDL_MOUSEBUTTONDOWN or ::SDL_MOUSEBUTTONUP
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',      # The window with mouse focus, if any
      'Uint32 which',         # The mouse instance id, or SDL_TOUCH_MOUSEID
      'Uint8 button',         # The mouse button index
      'Uint8 state',          # ::SDL_PRESSED or ::SDL_RELEASED
      'Uint8 clicks',         # 1 for single-click, 2 for double-click, etc.
      'Uint8 padding1',
      'Sint32 x',             # X coordinate, relative to window
      'Sint32 y'              # Y coordinate, relative to window
  ])
  typealias 'SDL_MouseButtonEvent', 'void*'

  const_set :SDL_MouseWheelEvent, struct([
      'Uint32 type',          # ::SDL_MOUSEWHEEL
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',      # The window with mouse focus, if any
      'Uint32 which',         # The mouse instance id, or SDL_TOUCH_MOUSEID
      'Sint32 x',             # The amount scrolled horizontally, positive to the right and negative to the left
      'Sint32 y',             # The amount scrolled vertically, positive away from the user and negative toward the user
      'Uint32 direction'      # Set to one of the SDL_MOUSEWHEEL_* defines. When FLIPPED the values in X and Y will be opposite. Multiply by -1 to change them back
  ])
  typealias 'SDL_MouseWheelEvent', 'void*'

  const_set :SDL_JoyAxisEvent, struct([
      'Uint32 type',          # ::SDL_JOYAXISMOTION
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 axis',           # The joystick axis index
      'Uint8 padding1',
      'Uint8 padding2',
      'Uint8 padding3',
      'Sint16 value',         # The axis value (range: -32768 to 32767)
      'Uint16 padding4'
  ])
  typealias 'SDL_JoyAxisEvent', 'void*'

  const_set :SDL_JoyBallEvent, struct([
      'Uint32 type',          # ::SDL_JOYBALLMOTION
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 ball',           # The joystick trackball index
      'Uint8 padding1',
      'Uint8 padding2',
      'Uint8 padding3',
      'Sint16 xrel',          # The relative motion in the X direction
      'Sint16 yrel'           # The relative motion in the Y direction
  ])
  typealias 'SDL_JoyBallEvent', 'void*'

  const_set :SDL_JoyHatEvent, struct([
      'Uint32 type',          # ::SDL_JOYHATMOTION
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 hat',            # The joystick hat index
      'Uint8 value',          # The hat position value.
                              #   \sa ::SDL_HAT_LEFTUP ::SDL_HAT_UP ::SDL_HAT_RIGHTUP
                              #   \sa ::SDL_HAT_LEFT ::SDL_HAT_CENTERED ::SDL_HAT_RIGHT
                              #   \sa ::SDL_HAT_LEFTDOWN ::SDL_HAT_DOWN ::SDL_HAT_RIGHTDOWN
                              #
                              #   Note that zero means the POV is centered.
      'Uint8 padding1',
      'Uint8 padding2'
  ])
  typealias 'SDL_JoyHatEvent', 'void*'

  const_set :SDL_JoyButtonEvent, struct([
      'Uint32 type',          # ::SDL_JOYBUTTONDOWN or ::SDL_JOYBUTTONUP
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 button',         # The joystick button index
      'Uint8 state',          # ::SDL_PRESSED or ::SDL_RELEASED
      'Uint8 padding1',
      'Uint8 padding2'
  ])
  typealias 'SDL_JoyButtonEvent', 'void*'

  const_set :SDL_JoyDeviceEvent, struct([
      'Uint32 type',          # ::SDL_JOYDEVICEADDED or ::SDL_JOYDEVICEREMOVED
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'Sint32 which'          # The joystick device index for the ADDED event, instance id for the REMOVED event
  ])
  typealias 'SDL_JoyDeviceEvent', 'void*'

  const_set :SDL_ControllerAxisEvent, struct([
      'Uint32 type',          # ::SDL_CONTROLLERAXISMOTION
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 axis',           # The controller axis (SDL_GameControllerAxis)
      'Uint8 padding1',
      'Uint8 padding2',
      'Uint8 padding3',
      'Sint16 value',         # The axis value (range: -32768 to 32767)
      'Uint16 padding4'
  ])
  typealias 'SDL_ControllerAxisEvent', 'void*'

  const_set :SDL_ControllerButtonEvent, struct([
      'Uint32 type',          # ::SDL_CONTROLLERBUTTONDOWN or ::SDL_CONTROLLERBUTTONUP
      'Uint32 timestamp',     # In milliseconds, populated using SDL_GetTicks()
      'SDL_JoystickID which', # The joystick instance id
      'Uint8 button',         # The controller button (SDL_GameControllerButton)
      'Uint8 state',          # ::SDL_PRESSED or ::SDL_RELEASED
      'Uint8 padding1',
      'Uint8 padding2'
  ])
  typealias 'SDL_ControllerButtonEvent', 'void*'

  const_set :SDL_ControllerDeviceEvent, struct([
      'Uint32 type',         # ::SDL_CONTROLLERDEVICEADDED, ::SDL_CONTROLLERDEVICEREMOVED, or ::SDL_CONTROLLERDEVICEREMAPPED
      'Uint32 timestamp',    # In milliseconds, populated using SDL_GetTicks()
      'Sint32 which'         # The joystick device index for the ADDED event, instance id for the REMOVED or REMAPPED event
  ])
  typealias 'SDL_ControllerDeviceEvent', 'void*'

  const_set :SDL_AudioDeviceEvent, struct([
      'Uint32 type',         # ::SDL_AUDIODEVICEADDED, or ::SDL_AUDIODEVICEREMOVED
      'Uint32 timestamp',    # In milliseconds, populated using SDL_GetTicks()
      'Uint32 which',        # The audio device index for the ADDED event (valid until next SDL_GetNumAudioDevices() call), SDL_AudioDeviceID for the REMOVED event
      'Uint8 iscapture',     # zero if an output device, non-zero if a capture device.
      'Uint8 padding1',
      'Uint8 padding2',
      'Uint8 padding3'
  ])
  typealias 'SDL_AudioDeviceEvent', 'void*'


  const_set :SDL_TouchFingerEvent, struct([
      'Uint32 type',         # ::SDL_FINGERMOTION or ::SDL_FINGERDOWN or ::SDL_FINGERUP
      'Uint32 timestamp',    # In milliseconds, populated using SDL_GetTicks()
      'SDL_TouchID touchId', # The touch device id
      'SDL_FingerID fingerId',
      'float x',             # Normalized in the range 0...1
      'float y',             # Normalized in the range 0...1
      'float dx',            # Normalized in the range -1...1
      'float dy',            # Normalized in the range -1...1
      'float pressure'       # Normalized in the range 0...1
  ])
  typealias 'SDL_TouchFingerEvent', 'void*'

  const_set :SDL_MultiGestureEvent, struct([
      'Uint32 type',         # ::SDL_MULTIGESTURE
      'Uint32 timestamp',    # In milliseconds, populated using SDL_GetTicks()
      'SDL_TouchID touchId', # The touch device id
      'float dTheta',
      'float dDist',
      'float x',
      'float y',
      'Uint16 numFingers',
      'Uint16 padding'
  ])
  typealias 'SDL_MultiGestureEvent', 'void*'

  const_set :SDL_DollarGestureEvent, struct([
      'Uint32 type',         # ::SDL_DOLLARGESTURE or ::SDL_DOLLARRECORD
      'Uint32 timestamp',    # In milliseconds, populated using SDL_GetTicks()
      'SDL_TouchID touchId', # The touch device id
      'SDL_GestureID gestureId',
      'Uint32 numFingers',
      'float error',
      'float x',            # Normalized center of gesture
      'float y'             # Normalized center of gesture

  ])
  typealias 'SDL_DollarGestureEvent', 'void*'

  const_set :SDL_DropEvent, struct([
      'Uint32 type',        # ::SDL_DROPBEGIN or ::SDL_DROPFILE or ::SDL_DROPTEXT or ::SDL_DROPCOMPLETE
      'Uint32 timestamp',   # In milliseconds, populated using SDL_GetTicks()
      'char *file',         # The file name, which should be freed with SDL_free(), is NULL on begin/complete
      'Uint32 windowID'     # The window that was dropped on, if any
  ])
  typealias 'SDL_DropEvent', 'void*'

  const_set :SDL_QuitEvent, struct([
      'Uint32 type',        # ::SDL_QUIT
      'Uint32 timestamp'    # In milliseconds, populated using SDL_GetTicks()
  ])
  typealias 'SDL_QuitEvent', 'void*'

  const_set :SDL_OSEvent, struct([
      'Uint32 type',        # ::SDL_QUIT
      'Uint32 timestamp'    # In milliseconds, populated using SDL_GetTicks()
  ])
  typealias 'SDL_OSEvent', 'void*'

  const_set :SDL_UserEvent, struct([
      'Uint32 type',        # ::SDL_USEREVENT through ::SDL_LASTEVENT-1
      'Uint32 timestamp',   # In milliseconds, populated using SDL_GetTicks()
      'Uint32 windowID',    # The associated window if any
      'Sint32 code',        # User defined event code
      'void *data1',        # User defined data pointer
      'void *data2'         # User defined data pointer
  ])
  typealias 'SDL_UserEvent', 'void*'

  typealias 'SDL_SysWMmsg', 'void*'

  const_set :SDL_SysWMEvent, struct([
      'Uint32 type',      # ::SDL_SYSWMEVENT
      'Uint32 timestamp', # In milliseconds, populated using SDL_GetTicks()
      'SDL_SysWMmsg *msg' # driver dependent data, defined in SDL_syswm.h

  ])
  typealias 'SDL_SysWMEvent', 'void*'

  const_set :SDL_Event, union([
      'Uint32 type',
      'SDL_CommonEvent common',
      'SDL_WindowEvent window',
      'SDL_KeyboardEvent key',
      'SDL_TextEditingEvent edit',
      'SDL_TextInputEvent text',
      'SDL_MouseMotionEvent motion',
      'SDL_MouseButtonEvent button',
      'SDL_MouseWheelEvent wheel',
      'SDL_JoyAxisEvent jaxis',
      'SDL_JoyBallEvent jball',
      'SDL_JoyHatEvent jhat',
      'SDL_JoyButtonEvent jbutton',
      'SDL_JoyDeviceEvent jdevice',
      'SDL_ControllerAxisEvent caxis',
      'SDL_ControllerButtonEvent cbutton',
      'SDL_ControllerDeviceEvent cdevice',
      'SDL_AudioDeviceEvent adevice',
      'SDL_QuitEvent quit',
      'SDL_UserEvent user',
      'SDL_SysWMEvent syswm',
      'SDL_TouchFingerEvent tfinger',
      'SDL_MultiGestureEvent mgesture',
      'SDL_DollarGestureEvent dgesture',
      'SDL_DropEvent drop',
      'Uint8 padding[56]'
])
typealias 'SDL_Event', 'void*'

extern 'void SDL_PumpEvents(void)'

  # Enum: SDL_eventaction
  const_set :SDL_ADDEVENT,  0
  const_set :SDL_PEEKEVENT, 1
  const_set :SDL_GETEVENT,  2
  typealias 'SDL_eventaction', 'int'

  extern 'int SDL_PeepEvents(SDL_Event * events, int numevents,
                             SDL_eventaction action, Uint32 minType, Uint32 maxType)'
  extern 'SDL_bool SDL_HasEvent(Uint32 type)'
  extern 'SDL_bool SDL_HasEvents(Uint32 minType, Uint32 maxType)'
  extern 'void SDL_FlushEvent(Uint32 type)'
  extern 'void SDL_FlushEvents(Uint32 minType, Uint32 maxType)'
  extern 'int SDL_PollEvent(SDL_Event * event)'
  extern 'int SDL_WaitEvent(SDL_Event * event)'
  extern 'int SDL_WaitEventTimeout(SDL_Event * event, int timeout)'
  extern 'int SDL_PushEvent(SDL_Event * event)'

  # typedef int (* SDL_EventFilter) (void *userdata, SDL_Event * event)
  typealias 'SDL_EventFilter', 'void*'

  extern 'void SDL_SetEventFilter(SDL_EventFilter filter, void *userdata)'
  extern 'SDL_bool SDL_GetEventFilter(SDL_EventFilter * filter, void **userdata)'
  extern 'void SDL_AddEventWatch(SDL_EventFilter filter, void *userdata)'
  extern 'void SDL_DelEventWatch(SDL_EventFilter filter, void *userdata)'
  extern 'void SDL_FilterEvents(SDL_EventFilter filter, void *userdata)'

  const_set :SDL_QUERY,   -1
  const_set :SDL_IGNORE,   0
  const_set :SDL_DISABLE,  0
  const_set :SDL_ENABLE,   1

  extern 'Uint8 SDL_EventState(Uint32 type, int state)'

  const_set :SDL_GetEventState, -> (type) { self.SDL_EventState(type, SDL_QUERY) }

  extern 'Uint32 SDL_RegisterEvents(int numevents)'
end
