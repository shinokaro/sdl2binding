require_relative 'window/display_mode'

module SDL2
  class Window

    class << self
      def current_video_driver
        char_ptr = SDL2.SDL_GetCurrentVideoDriver
        (char_ptr.to_i == 0) ? nil : char_ptr.to_s
      end

      def num_video_drivers
        num = SDL2.SDL_GetNumVideoDrivers
        raise "#{SDL2.SDL_GetError}" if num < 0
        num
      end

      def video_driver(index)
        char = SDL2.SDL_GetVideoDriver(index)
        (char.to_i == 0) ? nil : char.to_s
      end
      #
      # Displays
      #
      def num_video_displays
        num = SDL2.SDL_GetNumVideoDisplays
        raise "#{SDL2.SDL_GetError}" if num < 0
        num
      end

      def display_name(display_index)
        char = SDL2.SDL_GetDisplayName(display_index)
        raise "#{SDL2.SDL_GetError}" if char.to_i == 0
        char.to_s
      end

      def display_bounds(display_index)
        rect = SDL2::SDL_Rect.malloc
        error = SDL2.SDL_GetDisplayBounds(display_index, rect)
        raise "#{SDL2.SDL_GetError}" if error < 0
        rect
      end

      def display_usable_bounds(display_index)
        rect = SDL2::SDL_Rect.malloc
        error = SDL2.SDL_GetDisplayUsableBounds(display_index, rect)
        raise "#{SDL2.SDL_GetError}" if error < 0
        rect
      end

      def display_dpi(display_index)
        ddpi = Fiddle::Pointer.malloc(Fiddle::SIZEOF_FLOAT)
        hdpi = Fiddle::Pointer.malloc(Fiddle::SIZEOF_FLOAT)
        vdpi = Fiddle::Pointer.malloc(Fiddle::SIZEOF_FLOAT)
        error = SDL2.SDL_GetDisplayDPI(display_index, ddpi, hdpi, vdpi)
        raise "#{SDL2.SDL_GetError}" if error < 0
        [ddpi, hdpi, vdpi]
      end

      def num_display_modes(display_index)
        num = SDL2.SDL_GetNumDisplayModes(display_index)
        raise "#{SDL2.SDL_GetError}" if num < 0
        num
      end

      def display_mode(display_index, mode_index)
        mode = DisplayMode.new
        error = SDL2.SDL_GetDisplayMode(display_index, mode_index, mode)
        raise "#{SDL2.SDL_GetError}" if error < 0
        mode
      end

      def desktop_display_mode(display_index)
        mode = DisplayMode.new
        error = SDL2.SDL_GetDesktopDisplayMode(display_index, mode)
        raise "#{SDL2.SDL_GetError}" if error < 0
        mode
      end

      def current_display_mode(display_index)
        mode = DisplayMode.new
        error = SDL2.SDL_GetCurrentDisplayMode(display_index, mode)
        raise "#{SDL2.SDL_GetError}" if error < 0
        mode
      end

      def closest_display_mode(display_index, mode)
        closest = DisplayMode.new
        error = SDL2.SDL_GetClosestDisplayMode(display_index, mode, closest)
        raise "#{SDL2.SDL_GetError}" if error.to_i == 0
        closest
      end
      #
      #
      #
      def grabbed_window
        window = SDL_Window *SDL_GetGrabbedWindow
        (window.to_i == 0) ? nil : window
      end

      def screen_saver?
        SDL2::SDL_bool[SDL2.SDL_IsScreenSaverEnabled]
      end

      def enable_screen_saver
        SDL2.SDL_EnableScreenSaver
      end

      def disable_screen_saver
        SDL2.SDL_DisableScreenSaver
      end

      def window_from_id(window_id)
        window = SDL2.SDL_GetWindowFromID(window_id)
        raise "#{SDL2.SDL_GetError}" if window.to_i == 0
        window
      end

      def create_window_from(data)
        window = SDL2.SDL_CreateWindowFrom(data)
        raise "#{SDL2.SDL_GetError}" if window.to_i == 0
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
            fullscreen         && SDL2::SDL_WINDOW_FULLSCREEN,
            opengl             && SDL2::SDL_WINDOW_OPENGL,
            hidden             && SDL2::SDL_WINDOW_HIDDEN,
            borderless         && SDL2::SDL_WINDOW_BORDERLESS,
            resizable          && SDL2::SDL_WINDOW_RESIZABLE,
            minimized          && SDL2::SDL_WINDOW_MINIMIZED,
            maximized          && SDL2::SDL_WINDOW_MAXIMIZED,
            grabbed            && SDL2::SDL_WINDOW_INPUT_GRABBED,
            input_focus        && SDL2::SDL_WINDOW_INPUT_FOCUS,
            mouse_focus        && SDL2::SDL_WINDOW_MOUSE_FOCUS,
            fullscreen_desktop && SDL2::SDL_WINDOW_FULLSCREEN_DESKTOP,
            foreign            && SDL2::SDL_WINDOW_FOREIGN,
            allow_highdpi      && SDL2::SDL_WINDOW_ALLOW_HIGHDPI,
            mouse_capture      && SDL2::SDL_WINDOW_MOUSE_CAPTURE,
            always_on_top      && SDL2::SDL_WINDOW_ALWAYS_ON_TOP,
            skip_taskbar       && SDL2::SDL_WINDOW_SKIP_TASKBAR,
            utility            && SDL2::SDL_WINDOW_UTILITY,
            tooltip            && SDL2::SDL_WINDOW_TOOLTIP,
            popup_menu         && SDL2::SDL_WINDOW_POPUP_MENU,
            vulkan             && SDL2::SDL_WINDOW_VULKAN
        ].select(&:itself).inject(0, :|)

        window = SDL2.SDL_CreateWindow(title, x, y, w, h, flags)
        raise "#{SDL2.SDL_GetError}" if window.to_i == 0

        ObjectSpace.define_finalizer(window, proc { SDL2.SDL_DestroyWindow(window) } )

        super(window)
      end
    end

    def initialize(window)
      @window ||= window
    end

    def []=(name, userdata)
      SDL2.SDL_SetWindowData(@window, name, userdata)
    end

    def [](name)
      SDL2.SDL_GetWindowData(@window, name) #=> void pointer
    end

    def display_index
      SDL2.SDL_GetWindowDisplayIndex(@window)
    end

    def fullscreen_display_mode=(mode)
      error = SDL2.SDL_SetWindowDisplayMode(@window, mode)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def fullscreen_display_mode
      mode = DisplayMode.new
      error = SDL2.SDL_GetWindowDisplayMode(@window, mode)
      raise "#{SDL2.SDL_GetError}" if error < 0
      mode
    end

    def fullscreen
      error = SDL2.SDL_SetWindowFullscreen(@window, SDL2::SDL_WINDOW_FULLSCREEN)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def fullscreen_desktop
      error = SDL2.SDL_SetWindowFullscreen(@window, SDL2::SDL_WINDOW_FULLSCREEN_DESKTOP)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def window_mode
      error = SDL2.SDL_SetWindowFullscreen(@window, 0)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def pixel_format
      pixel_format = SDL2.SDL_GetWindowPixelFormat(@window)
      raise "#{SDL2.SDL_GetError}" if pixel_format == SDL2::SDL_PIXELFORMAT_UNKNOWN
      pixel_format
    end

    def window_id
      id = SDL2.SDL_GetWindowID(@window)
      raise "#{SDL2.SDL_GetError}" if id == 0
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
      SDL2.SDL_SetWindowPosition(@window, x || SDL2::SDL_WINDOWPOS_CENTERED[], y || SDL2::SDL_WINDOWPOS_CENTERED[])
    end

    def position
      x = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      y = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowPosition(@window, x, y)
      [x.to_str.unpack('l!')[0], y.to_str.unpack('l!')[0]]
    end

    def x=(x)
      SDL2.SDL_SetWindowPosition(@window, x || SDL2::SDL_WINDOWPOS_CENTERED[], SDL2::SDL_WINDOWPOS_UNDEFINED[])
    end

    def x
      x = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowPosition(@window, x, nil)
      x.to_str.unpack('l!')[0]
    end

    def y=(y)
      SDL2.SDL_SetWindowPosition(@window, SDL2::SDL_WINDOWPOS_UNDEFINED[], y || SDL2::SDL_WINDOWPOS_CENTERED[])
    end

    def y
      y = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowPosition(@window, nil, y)
      y.to_str.unpack('l!')[0]
    end

    def size=(w, h)
      SDL2.SDL_SetWindowSize(@window, w, h)
    end

    def size
      w = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      h = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowSize(@window, w, h)
      [w.to_str.unpack('l!')[0], h.to_str.unpack('l!')[0]]
    end

    def w
      w = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowSize(@window, w, nil)
      w.to_str.unpack('l!')[0]
    end

    alias width w

    def h
      h = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowSize(@window, nil, h)
      h.to_str.unpack('l!')[0]
    end

    alias height h

    def minimum_size=(min_w_h)
      min_w, min_h = min_w_h
      SDL2.SDL_SetWindowMinimumSize(@window, min_w, min_h)
    end

    def minimum_size
      w = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      h = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowMinimumSize(@window, w, h)
      [w.to_str.unpack('l!')[0], h.to_str.unpack('l!')[0]]
    end

    def maximum_size=(max_w_h)
      max_w, max_h = max_w_h
      SDL2.SDL_SetWindowMaximumSize(@window, max_w, max_h)
    end

    def maximum_size
      w = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      h = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      SDL2.SDL_GetWindowMaximumSize(@window, w, h)
      [w.to_str.unpack('l!')[0], h.to_str.unpack('l!')[0]]
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

    def raise
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
      raise "#{SDL2.SDL_GetError}" if surface.to_i == 0
      surface
    end

    def update_window_surface
      error = SDL2.SDL_UpdateWindowSurface(@window)
      raise "#{SDL2.SDL_GetError}" if error < 0
      self
    end

    def update_window_surface_rects(*rects)
      error = SDL2.SDL_UpdateWindowSurfaceRects(@window, rects. rects.size)
      raise "#{SDL2.SDL_GetError}" if error < 0
      self
    end

    def grab=(grabbed)
      SDL2.SDL_SetWindowGrab(@window, grabbed)
    end

    def grab
      SDL2::SDL_bool[SDL2.SDL_GetWindowGrab(@window)]
    end

    def opacity=(opacity)
      error = SDL2.SDL_SetWindowOpacity(@window, opacity.to_f)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def opacity
      out_opacity = Fiddle::Pointer.malloc(Fiddle::SIZEOF_FLOAT)
      error = SDL2.SDL_GetWindowOpacity(@window, out_opacity)
      raise "#{SDL2.SDL_GetError}" if error < 0
      out_opacity.to_str.unpack('f')[0]
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
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def window_brightness
      SDL2.SDL_GetWindowBrightness(@window)
    end

    def window_gamma_ramp=(gamma_maps)
      size = 256
      format = "S#{size}"
      red, green, blue = gamma_maps.map { |ary| ary.pack(format) }
      error = SDL2.SDL_SetWindowGammaRamp(@window, red, green, blue)
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def window_gamma_ramp
      size = 256
      red   = Fiddle::Pointer.malloc(Fiddle::SIZEOF_SHORT * size)
      green = Fiddle::Pointer.malloc(Fiddle::SIZEOF_SHORT * size)
      blue  = Fiddle::Pointer.malloc(Fiddle::SIZEOF_SHORT * size)
      error = SDL2.SDL_GetWindowGammaRamp(@window, red, green, blue)
      raise "#{SDL2.SDL_GetError}" if error < 0
      format = "S#{size}"
      [red.to_str.unpack(format), green.to_str.unpack(format), blue.to_str.unpack(format)]
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
      raise "#{SDL2.SDL_GetError}" if error < 0
    end

    def destroy
      SDL2.SDL_DestroyWindow(@window)
    end
  end
end