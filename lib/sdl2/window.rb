require_relative 'display_mode'
require_relative 'pixel_format'
require_relative 'window/accessor'
require_relative 'window/controller'
require_relative 'window/display'
require_relative 'window/flags'
require_relative 'window/surface'
require_relative 'window/window_mode'
require_relative 'window/for_x11'
require_relative 'window/hit_test'

module SDL2
  class Window
    class << self
      def grabbed_window
        window = SDL2.SDL_GetGrabbedWindow
        (Fiddle::NULL == window) ? nil : window
      end


      def window_from_id(window_id)
        window = SDL2.SDL_GetWindowFromID(window_id)
        raise Error if Fiddle::NULL == window
        window
      end

      def create_window_from(data)
        window = SDL2.SDL_CreateWindowFrom(data)
        raise Error if Fiddle::NULL == window
        window
      end

      def new(x = 0, y = 0, w = 640, h = 480, title: nil, icon: nil, **flags)
        window = SDL2.SDL_CreateWindow(title, x, y, w, h, Flags.create(**flags))
        raise Error if window == Fiddle::NULL

        # ptr.free Fiddle::CFunc{ SDL2.SDL_DestroyWindow(window.to_i) }
        # ObjectSpace.define_finalizer(window, proc { SDL2.SDL_DestroyWindow(window) } )

        super(window)
      end
    end

    def initialize(window)
      @window ||= window
    end

    attr_reader :window

    def pixel_format
      pixel_format = SDL2.SDL_GetWindowPixelFormat(window)
      raise Error if pixel_format == SDL_PIXELFORMAT_UNKNOWN
      PixelFormat.new(pixel_format)
    end

    def window_id
      id = SDL2.SDL_GetWindowID(window)
      raise Error if id == 0
      id
    end

    include Flags
    include WindowMode
    include Accessor
    include Controller
    include Surface
    include Display
    include ForX11
    include HitTest

    def destroy
      SDL2.SDL_DestroyWindow(window)
    end
  end
end
