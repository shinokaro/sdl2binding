module SDL2
  #
  # SDL_video.h
  #
  require_relative 'SDL_stdinc'
  require_relative 'SDL_rect'
  require_relative 'SDL_surface'

  const_set :SDL_DisplayMode, struct([
      'Uint32 format',    # pixel format
      'int w',            # width, in screen coordinates
      'int h',            # height, in screen coordinates
      'int refresh_rate', # refresh rate (or zero for unspecified)
      'void *driverdata'  # driver-specific data, initialize to 0
  ])
  typealias 'SDL_DisplayMode', 'void*'

  typealias 'SDL_Window', 'void*'

  # Enum: SDL_WindowFlags
  const_set :SDL_WINDOW_FULLSCREEN,    0x00000001 # fullscreen window
  const_set :SDL_WINDOW_OPENGL,        0x00000002 # window usable with OpenGL context
  const_set :SDL_WINDOW_SHOWN,         0x00000004 # window is visible
  const_set :SDL_WINDOW_HIDDEN,        0x00000008 # window is not visible
  const_set :SDL_WINDOW_BORDERLESS,    0x00000010 # no window decoration
  const_set :SDL_WINDOW_RESIZABLE,     0x00000020 # window can be resized
  const_set :SDL_WINDOW_MINIMIZED,     0x00000040 # window is minimized
  const_set :SDL_WINDOW_MAXIMIZED,     0x00000080 # window is maximized
  const_set :SDL_WINDOW_INPUT_GRABBED, 0x00000100 # window has grabbed input focus
  const_set :SDL_WINDOW_INPUT_FOCUS,   0x00000200 # window has input focus
  const_set :SDL_WINDOW_MOUSE_FOCUS,   0x00000400 # window has mouse focus
  const_set :SDL_WINDOW_FULLSCREEN_DESKTOP, ( SDL_WINDOW_FULLSCREEN | 0x00001000 )
  const_set :SDL_WINDOW_FOREIGN,       0x00000800 # window not created by SDL
  const_set :SDL_WINDOW_ALLOW_HIGHDPI, 0x00002000 # window should be created in high-DPI mode if supported */
  const_set :SDL_WINDOW_MOUSE_CAPTURE, 0x00004000 # window has mouse captured (unrelated to INPUT_GRABBED) */
  const_set :SDL_WINDOW_ALWAYS_ON_TOP, 0x00008000 # window should always be above others
  const_set :SDL_WINDOW_SKIP_TASKBAR,  0x00010000 # window should not be added to the taskbar
  const_set :SDL_WINDOW_UTILITY,       0x00020000 # window should be treated as a utility window
  const_set :SDL_WINDOW_TOOLTIP,       0x00040000 # window should be treated as a tooltip
  const_set :SDL_WINDOW_POPUP_MENU,    0x00080000 # window should be treated as a popup menu
  const_set :SDL_WINDOW_VULKAN,        0x10000000 # window usable for Vulkan surface
  typealias 'SDL_WindowFlags', 'int'

  const_set :SDL_WINDOWPOS_UNDEFINED_MASK,    0x1FFF_0000
  const_set :SDL_WINDOWPOS_UNDEFINED_DISPLAY, -> (x) { (SDL_WINDOWPOS_UNDEFINED_MASK | x) }
  const_set :SDL_WINDOWPOS_UNDEFINED,         -> { SDL_WINDOWPOS_UNDEFINED_DISPLAY[0] }
  const_set :SDL_WINDOWPOS_ISUNDEFINED,       -> (x) { (x & 0xFFFF_0000) == SDL_WINDOWPOS_UNDEFINED_MASK }
  const_set :SDL_WINDOWPOS_CENTERED_MASK,     0x2FFF_0000
  const_set :SDL_WINDOWPOS_CENTERED_DISPLAY,  -> (x) { (SDL_WINDOWPOS_CENTERED_MASK | x) }
  const_set :SDL_WINDOWPOS_CENTERED,          -> { SDL_WINDOWPOS_CENTERED_DISPLAY[0] }
  const_set :SDL_WINDOWPOS_ISCENTERED,        -> (x) { (x & 0xFFFF_0000) == SDL_WINDOWPOS_CENTERED_MASK }

  # Enum: SDL_WindowEventID
  const_set :SDL_WINDOWEVENT_NONE,         0  # Never used
  const_set :SDL_WINDOWEVENT_SHOWN,        1  # Window has been shown
  const_set :SDL_WINDOWEVENT_HIDDEN,       2  # Window has been hidden
  const_set :SDL_WINDOWEVENT_EXPOSED,      3  # Window has been exposed and should be redrawn
  const_set :SDL_WINDOWEVENT_MOVED,        4  # Window has been moved to data1, data2
  const_set :SDL_WINDOWEVENT_RESIZED,      5  # Window has been resized to data1xdata2
  const_set :SDL_WINDOWEVENT_SIZE_CHANGED, 6  # The window size has changed, either as a result of an API call or through the system or user changing the window size.
  const_set :SDL_WINDOWEVENT_MINIMIZED,    7  # Window has been minimized
  const_set :SDL_WINDOWEVENT_MAXIMIZED,    8  # Window has been maximized
  const_set :SDL_WINDOWEVENT_RESTORED,     9  # Window has been restored to normal size and position
  const_set :SDL_WINDOWEVENT_ENTER,        10 # Window has gained mouse focus
  const_set :SDL_WINDOWEVENT_LEAVE,        11 # Window has lost mouse focus
  const_set :SDL_WINDOWEVENT_FOCUS_GAINED, 12 # Window has gained keyboard focus
  const_set :SDL_WINDOWEVENT_FOCUS_LOST,   13 # Window has lost keyboard focus
  const_set :SDL_WINDOWEVENT_CLOSE,        14 # The window manager requests that the window be closed
  const_set :SDL_WINDOWEVENT_TAKE_FOCUS,   15 # Window is being offered a focus (should SetWindowInputFocus() on itself or a subwindow, or ignore)
  const_set :SDL_WINDOWEVENT_HIT_TEST,     16 # Window had a hit test that wasn't SDL_HITTEST_NORMAL.
  typealias 'SDL_WindowEventID', 'int'

  typealias 'SDL_GLContext', 'void*'

  # Enum: SDL_GLattr
  const_set :SDL_GL_RED_SIZE,         0
  const_set :SDL_GL_GREEN_SIZE,       1
  const_set :SDL_GL_BLUE_SIZE,        2
  const_set :SDL_GL_ALPHA_SIZE,       3
  const_set :SDL_GL_BUFFER_SIZE,      4
  const_set :SDL_GL_DOUBLEBUFFER,     5
  const_set :SDL_GL_DEPTH_SIZE,       6
  const_set :SDL_GL_STENCIL_SIZE,     7
  const_set :SDL_GL_ACCUM_RED_SIZE,   8
  const_set :SDL_GL_ACCUM_GREEN_SIZE, 9
  const_set :SDL_GL_ACCUM_BLUE_SIZE,  10
  const_set :SDL_GL_ACCUM_ALPHA_SIZE, 11
  const_set :SDL_GL_STEREO,           12
  const_set :SDL_GL_MULTISAMPLEBUFFERS, 13
  const_set :SDL_GL_MULTISAMPLESAMPLES, 14
  const_set :SDL_GL_ACCELERATED_VISUAL, 15
  const_set :SDL_GL_RETAINED_BACKING,   16
  const_set :SDL_GL_CONTEXT_MAJOR_VERSION, 17
  const_set :SDL_GL_CONTEXT_MINOR_VERSION, 18
  const_set :SDL_GL_CONTEXT_EGL,           19
  const_set :SDL_GL_CONTEXT_FLAGS,         20
  const_set :SDL_GL_CONTEXT_PROFILE_MASK,  21
  const_set :SDL_GL_SHARE_WITH_CURRENT_CONTEXT, 22
  const_set :SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,   23
  const_set :SDL_GL_CONTEXT_RELEASE_BEHAVIOR,   24
  const_set :SDL_GL_CONTEXT_RESET_NOTIFICATION, 25
  const_set :SDL_GL_CONTEXT_NO_ERROR,           26
  typealias 'SDL_GLattr', 'int'

  # Enum: SDL_GLprofile
  const_set :SDL_GL_CONTEXT_PROFILE_CORE,          0x0001
  const_set :SDL_GL_CONTEXT_PROFILE_COMPATIBILITY, 0x0002
  const_set :SDL_GL_CONTEXT_PROFILE_ES,            0x0004 # GLX_CONTEXT_ES2_PROFILE_BIT_EXT
  typealias 'SDL_GLprofile', 'int'

  # Enum: SDL_GLcontextFlag
  const_set :SDL_GL_CONTEXT_DEBUG_FLAG,              0x0001
  const_set :SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG, 0x0002
  const_set :SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG,      0x0004
  const_set :SDL_GL_CONTEXT_RESET_ISOLATION_FLAG,    0x0008
  typealias 'SDL_GLcontextFlag', 'int'

  # Enum: SDL_GLcontextReleaseFlag
  const_set :SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE,  0x0000
  const_set :SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH, 0x0001
  typealias 'SDL_GLcontextReleaseFlag', 'int'

  # Enum: SDL_GLContextResetNotification
  const_set :SDL_GL_CONTEXT_RESET_NO_NOTIFICATION, 0x0000
  const_set :SDL_GL_CONTEXT_RESET_LOSE_CONTEXT,    0x0001
  typealias 'SDL_GLContextResetNotification', 'int'
  #
  # Functions
  #
  extern 'int SDL_GetNumVideoDrivers(void)'
  extern 'const char *SDL_GetVideoDriver(int index)'
  extern 'int SDL_VideoInit(const char *driver_name)'
  extern 'void SDL_VideoQuit(void)'
  extern 'const char *SDL_GetCurrentVideoDriver(void)'
  extern 'int SDL_GetNumVideoDisplays(void)'
  extern 'const char *SDL_GetDisplayName(int displayIndex)'
  extern 'int SDL_GetDisplayBounds(int displayIndex, SDL_Rect * rect)'
  extern 'int SDL_GetDisplayDPI(int displayIndex, float * ddpi, float * hdpi, float * vdpi)'
  extern 'int SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect * rect)'
  extern 'int SDL_GetNumDisplayModes(int displayIndex)'
  extern 'int SDL_GetDisplayMode(int displayIndex, int modeIndex, SDL_DisplayMode * mode)'
  extern 'int SDL_GetDesktopDisplayMode(int displayIndex, SDL_DisplayMode * mode)'
  extern 'int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode * mode)'
  extern 'SDL_DisplayMode *SDL_GetClosestDisplayMode(int displayIndex,
                                               const SDL_DisplayMode * mode,
                                               SDL_DisplayMode * closest)'
  extern 'int SDL_GetWindowDisplayIndex(SDL_Window * window)'
  extern 'int SDL_SetWindowDisplayMode(SDL_Window * window, const SDL_DisplayMode * mode)'
  extern 'int SDL_GetWindowDisplayMode(SDL_Window * window, SDL_DisplayMode * mode)'
  extern 'Uint32 SDL_GetWindowPixelFormat(SDL_Window * window)'
  extern 'SDL_Window *SDL_CreateWindow(const char *title, int x, int y,
                                 int w, int h, Uint32 flags)'
  extern 'SDL_Window *SDL_CreateWindowFrom(const void *data)'
  extern 'Uint32 SDL_GetWindowID(SDL_Window * window)'
  extern 'SDL_Window *SDL_GetWindowFromID(Uint32 id)'
  extern 'Uint32 SDL_GetWindowFlags(SDL_Window * window)'
  extern 'void SDL_SetWindowTitle(SDL_Window * window, const char *title)'
  extern 'const char *SDL_GetWindowTitle(SDL_Window * window)'
  extern 'void SDL_SetWindowIcon(SDL_Window * window, SDL_Surface * icon)'
  extern 'void* SDL_SetWindowData(SDL_Window * window, const char *name, void *userdata)'
  extern 'void *SDL_GetWindowData(SDL_Window * window, const char *name)'
  extern 'void SDL_SetWindowPosition(SDL_Window * window, int x, int y)'
  extern 'void SDL_GetWindowPosition(SDL_Window * window, int *x, int *y)'
  extern 'void SDL_SetWindowSize(SDL_Window * window, int w, int h)'
  extern 'void SDL_GetWindowSize(SDL_Window * window, int *w, int *h)'
  extern 'int SDL_GetWindowBordersSize(SDL_Window * window, int *top,
                                 int *left, int *bottom, int *right)'
  extern 'void SDL_SetWindowMinimumSize(SDL_Window * window, int min_w, int min_h)'
  extern 'void SDL_GetWindowMinimumSize(SDL_Window * window, int *w, int *h)'
  extern 'void SDL_SetWindowMaximumSize(SDL_Window * window, int max_w, int max_h)'
  extern 'void SDL_GetWindowMaximumSize(SDL_Window * window, int *w, int *h)'
  extern 'void SDL_SetWindowBordered(SDL_Window * window, SDL_bool bordered)'
  extern 'void SDL_SetWindowResizable(SDL_Window * window, SDL_bool resizable)'
  extern 'void SDL_ShowWindow(SDL_Window * window)'
  extern 'void SDL_HideWindow(SDL_Window * window)'
  extern 'void SDL_RaiseWindow(SDL_Window * window)'
  extern 'void SDL_MaximizeWindow(SDL_Window * window)'
  extern 'void SDL_MinimizeWindow(SDL_Window * window)'
  extern 'void SDL_RestoreWindow(SDL_Window * window)'
  extern 'int SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags)'
  extern 'SDL_Surface * SDL_GetWindowSurface(SDL_Window * window)'
  extern 'int SDL_UpdateWindowSurface(SDL_Window * window)'
  extern 'int SDL_UpdateWindowSurfaceRects(SDL_Window * window,
                                     const SDL_Rect * rects, int numrects)'
  extern 'void SDL_SetWindowGrab(SDL_Window * window, SDL_bool grabbed)'
  extern 'SDL_bool SDL_GetWindowGrab(SDL_Window * window)'
  extern 'SDL_Window * SDL_GetGrabbedWindow(void)'
  extern 'int SDL_SetWindowBrightness(SDL_Window * window, float brightness)'
  extern 'float SDL_GetWindowBrightness(SDL_Window * window)'
  extern 'int SDL_SetWindowOpacity(SDL_Window * window, float opacity)'
  extern 'int SDL_GetWindowOpacity(SDL_Window * window, float * out_opacity)'
  extern 'int SDL_SetWindowModalFor(SDL_Window * modal_window, SDL_Window * parent_window)'
  extern 'int SDL_SetWindowInputFocus(SDL_Window * window)'
  extern 'int SDL_SetWindowGammaRamp(SDL_Window * window, const Uint16 * red,
                               const Uint16 * green, const Uint16 * blue)'
  extern 'int SDL_GetWindowGammaRamp(SDL_Window * window, Uint16 * red,
                               Uint16 * green, Uint16 * blue)'

  # Enum: SDL_HitTestResult
  const_set :SDL_HITTEST_NORMAL,             0 # Region is normal. No special properties.
  const_set :SDL_HITTEST_DRAGGABLE,          1 # Region can drag entire window.
  const_set :SDL_HITTEST_RESIZE_TOPLEFT,     2
  const_set :SDL_HITTEST_RESIZE_TOP,         3
  const_set :SDL_HITTEST_RESIZE_TOPRIGHT,    4
  const_set :SDL_HITTEST_RESIZE_RIGHT,       5
  const_set :SDL_HITTEST_RESIZE_BOTTOMRIGHT, 6
  const_set :SDL_HITTEST_RESIZE_BOTTOM,      7
  const_set :SDL_HITTEST_RESIZE_BOTTOMLEFT,  8
  const_set :SDL_HITTEST_RESIZE_LEFT,        9
  typealias 'SDL_HitTestResult', 'int'

  # typedef SDL_HitTestResult (*SDL_HitTest)(SDL_Window *win, const SDL_Point *area, void *data);
  typealias 'SDL_HitTest', 'void*' # callback function
  extern 'int   SDL_SetWindowHitTest(SDL_Window * window, SDL_HitTest callback, void *callback_data)'
  extern 'void  SDL_DestroyWindow(SDL_Window * window)'
  extern 'SDL_bool SDL_IsScreenSaverEnabled(void)'
  extern 'void  SDL_EnableScreenSaver(void)'
  extern 'void  SDL_DisableScreenSaver(void)'
  extern 'int   SDL_GL_LoadLibrary(const char *path)'
  extern 'void *SDL_GL_GetProcAddress(const char *proc)'
  extern 'void  SDL_GL_UnloadLibrary(void)'
  extern 'SDL_bool SDL_GL_ExtensionSupported(const char *extension)'
  extern 'void  SDL_GL_ResetAttributes(void)'
  extern 'int   SDL_GL_SetAttribute(SDL_GLattr attr, int value)'
  extern 'int   SDL_GL_GetAttribute(SDL_GLattr attr, int *value)'
  extern 'SDL_GLContext SDL_GL_CreateContext(SDL_Window * window)'
  extern 'int   SDL_GL_MakeCurrent(SDL_Window * window, SDL_GLContext context)'
  extern 'SDL_Window* SDL_GL_GetCurrentWindow(void)'
  extern 'SDL_GLContext SDL_GL_GetCurrentContext(void)'
  extern 'void  SDL_GL_GetDrawableSize(SDL_Window * window, int *w, int *h)'
  extern 'int   SDL_GL_SetSwapInterval(int interval)'
  extern 'int   SDL_GL_GetSwapInterval(void)'
  extern 'void  SDL_GL_SwapWindow(SDL_Window * window)'
  extern 'void  SDL_GL_DeleteContext(SDL_GLContext context)'
end
