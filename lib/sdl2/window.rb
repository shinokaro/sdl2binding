require_relative 'pointer'
require_relative 'helper'
require_relative 'display_mode'
require_relative 'pixel_format'
require_relative 'rect'
require_relative 'surface'

module SDL2
  class Window

    extend Helper

    class << self
      def grabbed_window
        window = SDL2.SDL_GetGrabbedWindow
        (window == Fiddle::NULL) ? nil : window
      end

      def screen_saver?
        SDL_bool[SDL2.SDL_IsScreenSaverEnabled]
      end

      def enable_screen_saver
        SDL2.SDL_EnableScreenSaver
      end

      def disable_screen_saver
        SDL2.SDL_DisableScreenSaver
      end

      def window_from_id(window_id)
        window = SDL2.SDL_GetWindowFromID(window_id)
        raise Error, error_msg if window == Fiddle::NULL
        window
      end

      def create_window_from(data)
        window = SDL2.SDL_CreateWindowFrom(data)
        raise Error, error_msg if window == Fiddle::NULL
        window
      end

      def new(title = nil, x = 0, y = 0, w = 640, h = 480,
              fullscreen: false, opengl: false, hidden: false,
              borderless: false, resizable: false, minimized: false,
              maximized: false, grabbed: false, input_focus: false,
              mouse_focus: false, fullscreen_desktop: false, foreign: false,
              allow_highdpi: false, mouse_capture: false, always_on_top: false,
              skip_taskbar: false, utility: false, tooltip: false,
              popup_menu: false, vulkan: false)

        flags = [
            fullscreen         && SDL_WINDOW_FULLSCREEN,
            opengl             && SDL_WINDOW_OPENGL,
            hidden             && SDL_WINDOW_HIDDEN,
            borderless         && SDL_WINDOW_BORDERLESS,
            resizable          && SDL_WINDOW_RESIZABLE,
            minimized          && SDL_WINDOW_MINIMIZED,
            maximized          && SDL_WINDOW_MAXIMIZED,
            grabbed            && SDL_WINDOW_INPUT_GRABBED,
            input_focus        && SDL_WINDOW_INPUT_FOCUS,
            mouse_focus        && SDL_WINDOW_MOUSE_FOCUS,
            fullscreen_desktop && SDL_WINDOW_FULLSCREEN_DESKTOP,
            foreign            && SDL_WINDOW_FOREIGN,
            allow_highdpi      && SDL_WINDOW_ALLOW_HIGHDPI,
            mouse_capture      && SDL_WINDOW_MOUSE_CAPTURE,
            always_on_top      && SDL_WINDOW_ALWAYS_ON_TOP,
            skip_taskbar       && SDL_WINDOW_SKIP_TASKBAR,
            utility            && SDL_WINDOW_UTILITY,
            tooltip            && SDL_WINDOW_TOOLTIP,
            popup_menu         && SDL_WINDOW_POPUP_MENU,
            vulkan             && SDL_WINDOW_VULKAN
        ].select(&:itself).inject(0, :|)

        window = SDL2.SDL_CreateWindow(title, x, y, w, h, flags)
        raise Error, error_msg if window == Fiddle::NULL

        ObjectSpace.define_finalizer(window, proc { SDL2.SDL_DestroyWindow(window) } )

        super(window)
      end
    end

    include Helper

    def initialize(window)
      @window ||= window
    end

    def []=(name, userdata)
      SDL2.SDL_SetWindowData(@window, name, userdata)
    end

    def [](name)
      SDL2.SDL_GetWindowData(@window, name) #=> void pointer
    end

    def display
      Display.new(SDL2.SDL_GetWindowDisplayIndex(@window))
    end

    def fullscreen_display_mode=(mode)
      error = SDL2.SDL_SetWindowDisplayMode(@window, mode)
      raise Error, error_msg if error < 0
    end

    def fullscreen_display_mode
      mode = SDL_DisplayMode.new
      error = SDL2.SDL_GetWindowDisplayMode(@window, mode)
      raise Error, error_msg if error < 0
      mode
    end

    def fullscreen
      error = SDL2.SDL_SetWindowFullscreen(@window, SDL_WINDOW_FULLSCREEN)
      raise Error, error_msg if error < 0
    end

    def fullscreen_desktop
      error = SDL2.SDL_SetWindowFullscreen(@window, SDL_WINDOW_FULLSCREEN_DESKTOP)
      raise Error, error_msg if error < 0
    end

    def window_mode
      error = SDL2.SDL_SetWindowFullscreen(@window, 0)
      raise Error, error_msg if error < 0
    end

    def pixel_format
      pixel_format = SDL2.SDL_GetWindowPixelFormat(@window)
      raise Error, error_msg if pixel_format == SDL_PIXELFORMAT_UNKNOWN
      PixelFormat.new(pixel_format)
    end

    def window_id
      id = SDL2.SDL_GetWindowID(@window)
      raise Error, error_msg if id == 0
      id
    end

    def window_flags
      SDL2.SDL_GetWindowFlags(window)
    end

    def title=(title)
      SDL2.SDL_SetWindowTitle(@window, title)
    end

    def title
      char = SDL2.SDL_GetWindowTitle(window)
      char.to_s.force_encoding('UTF-8')
    end

    def icon=(icon)
      # icon is SDL_Surface
      SDL2.SDL_SetWindowIcon(@window, icon)
    end

    def position=(x_y)
      x, y = x_y
      SDL2.SDL_SetWindowPosition(@window, x || SDL_WINDOWPOS_CENTERED, y || SDL_WINDOWPOS_CENTERED)
    end

    def position
      x, y = IntPointer.new, IntPointer.new
      SDL2.SDL_GetWindowPosition(@window, x, y)
      [x.value, y.value]
    end

    def x=(x)
      SDL2.SDL_SetWindowPosition(@window, x || SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_UNDEFINED)
    end

    def x
      x = IntPointer.new
      SDL2.SDL_GetWindowPosition(@window, x, nil)
      x.value
    end

    def y=(y)
      SDL2.SDL_SetWindowPosition(@window, SDL_WINDOWPOS_UNDEFINED, y || SDL_WINDOWPOS_CENTERED)
    end

    def y
      y = IntPointer.new
      SDL2.SDL_GetWindowPosition(@window, nil, y)
      y.value
    end

    def size=(w, h)
      SDL2.SDL_SetWindowSize(@window, w, h)
    end

    def size
      w, h = IntPointer.new, IntPointer.new
      SDL2.SDL_GetWindowSize(@window, w, h)
      [w.value, h.value]
    end

    def w
      w = IntPointer.new
      SDL2.SDL_GetWindowSize(@window, w, nil)
      w.value
    end

    alias width w

    def h
      h = IntPointer.new
      SDL2.SDL_GetWindowSize(@window, nil, h)
      h.value
    end

    alias height h

    def minimum_size=(min_w_h)
      min_w, min_h = min_w_h
      SDL2.SDL_SetWindowMinimumSize(@window, min_w, min_h)
    end

    def minimum_size
      w, h = IntPointer.new, IntPointer.new
      SDL2.SDL_GetWindowMinimumSize(@window, w, h)
      [w.value, h.value]
    end

    def maximum_size=(max_w_h)
      max_w, max_h = max_w_h
      SDL2.SDL_SetWindowMaximumSize(@window, max_w, max_h)
    end

    def maximum_size
      w, h = IntPointer.new, IntPointer.new
      SDL2.SDL_GetWindowMaximumSize(@window, w, h)
      [w.value, h.value]
    end

    def borderd=(bordered)
      SDL2.SDL_SetWindowBordered(@window, !!bordered)
    end

    def resizable=(resizable)
      SDL2.SDL_SetWindowResizable(@window, !!resizable)
    end

    def show
      SDL2.SDL_ShowWindow(@window)
    end

    def hide
      SDL2.SDL_HideWindow(@window)
    end

    def raise_window
      SDL2.SDL_RaiseWindow(@window)
    end

    def maximize
      SDL2.SDL_MaximizeWindow(@window)
    end

    def minimize
      SDL2.SDL_MinimizeWindow(@window)
    end

    def restore
      SDL2.SDL_RestoreWindow(@window)
    end

    def surface
      surface = SDL2.SDL_GetWindowSurface(@window)
      raise Error, error_msg if surface == Fiddle::NULL
      Surface.new(surface)
    end

    def update_window_surface
      error = SDL2.SDL_UpdateWindowSurface(@window)
      raise Error, error_msg if error < 0
      self
    end

    alias update update_window_surface

    def update_window_surface_rects(rects)
      error = SDL2.SDL_UpdateWindowSurfaceRects(@window, rects. rects.size)
      raise Error, error_msg if error < 0
      self
    end

    def grab=(grabbed)
      SDL2.SDL_SetWindowGrab(@window, grabbed)
    end

    def grab
      SDL_bool[SDL2.SDL_GetWindowGrab(@window)]
    end

    def opacity=(opacity)
      error = SDL2.SDL_SetWindowOpacity(@window, opacity.to_f)
      raise Error, error_msg if error != -1 && error < 0
    end

    def opacity
      out_opacity = FloatPointer.new
      error = SDL2.SDL_GetWindowOpacity(@window, out_opacity)
      raise Error, error_msg if error < 0
      out_opacity.value
    end
    #
    # X11 only
    #
    # int SDL_GetWindowBordersSize(SDL_Window * window, int *top, int *left, int *bottom, int *right)
    #
    # int SDL_SetWindowModalFor(SDL_Window * modal_window, SDL_Window * parent_window)
    #
    # int SDL_SetWindowInputFocus(SDL_Window * window)

    #
    # for Display
    #
    def window_brightness=(brightness)
      error = SDL2.SDL_SetWindowBrightness(@window, brightness.to_f)
      raise Error, error_msg if error < 0
    end

    def window_brightness
      SDL2.SDL_GetWindowBrightness(@window)
    end

    def window_gamma_ramp=(gamma_maps)
      red, green, blue = gamma_maps.map { |ary| ary.pack('S!256') }
      error = SDL2.SDL_SetWindowGammaRamp(@window, red, green, blue)
      raise Error, error_msg if error < 0
    end

    def window_gamma_ramp
      red, green, blue = GammaRampPointer.new, GammaRampPointer.new, GammaRampPointer.new
      error = SDL2.SDL_GetWindowGammaRamp(@window, red, green, blue)
      raise Error, error_msg if error < 0
      [red.values, green.values, blue.values]
    end
    #
    # Hit test
    #
    def hit_test(&block)
      # typedef SDL_HitTestResult (*SDL_HitTest)(SDL_Window *win, const SDL_Point *area, void *data)
      callback = Fiddle::Closure::BlockCaller.new(
          Fiddle::TYPE_VOIDP,
          [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP],
          &block)
      error = SDL2.SDL_SetWindowHitTest(@window, callback, nil)
      raise Error, error_msg if error < 0
    end

    def destroy
      SDL2.SDL_DestroyWindow(@window)
    end
  end
end
