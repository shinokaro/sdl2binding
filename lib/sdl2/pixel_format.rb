module SDL2
  class PixelFormat
    def initialize(format = 0)
      @format = format.instance_of?(Integer) ? format : SDL2.const_get("SDL_PIXELFORMAT_#{format.upcase}", false)
    end

    def to_i
      @format
    end

    def name
      find_const_name(to_i, 'SDL_PIXELFORMAT_')
    end

    alias to_s name

    def type
      SDL_PIXELTYPE[@format]
    end

    def type_name
      four_cc? ? '' : find_const_name(type, 'SDL_PIXELTYPE_')
    end

    def order
      SDL_PIXELORDER[@format]
    end

    def order_name
      prefix = case type_name
                 when /INDEX/
                   'SDL_BITMAPORDER_'
                 when /PACKED/
                   'SDL_PACKEDORDER_'
                 when /ARRAY/
                   'SDL_ARRAYORDER_'
               end

      !four_cc? && prefix ? find_const_name(order, prefix) : ''
    end

    def layout
      SDL_PIXELLAYOUT[@format]
    end

    def layout_name
      four_cc? ? '' : find_const_name(layout, 'SDL_PACKEDLAYOUT_')
    end

    def bits
      SDL_BITSPERPIXEL[@format]
    end

    def bytes
      SDL_BYTESPERPIXEL[@format]
    end

    def indexed?
      SDL_ISPIXELFORMAT_INDEXED[@format]
    end

    def alpha?
      SDL_ISPIXELFORMAT_ALPHA[@format]
    end

    def four_cc?
      SDL_ISPIXELFORMAT_FOURCC[@format]
    end

    private

    def find_const_name(i, prefix)
      SDL2.constants.grep(/^#{prefix}/).
          find { |name| SDL2.const_get(name, false) == i }.to_s.delete_prefix(prefix)
    end
  end
end
