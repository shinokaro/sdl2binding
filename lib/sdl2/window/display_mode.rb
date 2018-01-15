require 'forwardable'

module SDL2
  class Window
    class DisplayMode
      class << self
        def new(w: 0, h: 0, refresh_rate: 0,
                type: 0, order: 0, layout: 0, bits: 0, bytes:0)
          format = SDL2::SDL_DEFINE_PIXELFORMAT[type, order, layout, bits, bytes]
          display_mode = SDL2::SDL_DisplayMode.malloc
          display_mode.format       = format
          display_mode.w            = w
          display_mode.h            = h
          display_mode.refresh_rate = refresh_rate
          display_mode.driverdata   = nil
          super(display_mode)
        end
      end

      extend Forwardable

      def_delegators :@display_mode, :format, :w, :h, :refresh_rate, :to_i

      def initialize(display_mode)
        @display_mode ||= display_mode
      end

      def pixel_type
        SDL2::SDL_PIXELTYPE[format]
      end

      def pixel_order
        SDL2::SDL_PIXELORDER[format]
      end

      def pixel_layout
        SDL2::SDL_PIXELLAYOUT[format]
      end

      def bits_per_pixel
        SDL2::SDL_BITSPERPIXEL[format]
      end

      def bytes_per_pixel
        SDL2::SDL_BYTESPERPIXEL[format]
      end

      def indexed?
        SDL2::SDL_ISPIXELFORMAT_INDEXED[format]
      end

      def alpha?
        SDL2::SDL_ISPIXELFORMAT_ALPHA[format]
      end

      def fourcc? # FourCC
        SDL2::SDL_ISPIXELFORMAT_FOURCC[format]
      end
    end
  end
end
