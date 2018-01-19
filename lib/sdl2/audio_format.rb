module SDL2
  class AudioFormat

    def initialize(format)
      @format = format.instance_of?(Integer) ? format : SDL2.const_get("AUDIO_#{format.upcase}", false)
    end

    attr_reader :format

    alias to_i format

    def name
      prefix = 'AUDIO_'
      SDL2.constants.grep(/^#{prefix}/).
          find { |name| SDL2.const_get(name, false) == @format }.to_s.delete_prefix(prefix)
    end

    alias to_s name

    def bit_size
      SDL_AUDIO_BITSIZE[@format]
    end

    alias bits bit_size

    def float?
      SDL_AUDIO_ISFLOAT[@format]
    end

    def big_endian?
      SDL_AUDIO_ISBIGENDIAN[@format]
    end

    def signed?
      SDL_AUDIO_ISSIGNED[@format]
    end

    def int?
      SDL_AUDIO_ISINT[@format]
    end

    def little_endian?
      SDL_AUDIO_ISLITTLEENDIAN[@format]
    end

    def unsigned?
      SDL_AUDIO_ISUNSIGNED[@format]
    end
  end
end