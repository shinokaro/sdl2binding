require 'forwardable'

module SDL2
  class Audio
    module AudioFormat
      # brief Audio format flags. (from SDL_audio.h)
      #
      #   These are what the 16 bits in SDL_AudioFormat currently mean...
      #   (Unspecified bits are always zero).
      #
      # ++-----------------------sample is signed if set
      # ||       ++-----------sample is bigendian if set
      # ||       ||          ++---sample is float if set
      # ||       ||          ||
      # ||       ||          || +---sample bit size---+
      # ||       ||          || |                     |
      # 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
      #
      MASK_BITSIZE  = 0x00FF
      MASK_DATATYPE = (1<<8)
      MASK_ENDIAN   = (1<<12)
      MASK_SIGNED   = (1<<15)

      def self.create(format: nil, signed: true, bigendian: false, float: false, bit_size: 16)
        format || [
            signed    && MASK_SIGNED,
            bigendian && MASK_ENDIAN,
            float     && MASK_DATATYPE,
            (bit_size &  MASK_BITSIZE)
        ].select(&:itself).inject(0, :|)
      end

      def bit_size
        (format & MASK_BITSIZE)
      end

      def float?
        (format & MASK_DATATYPE) != 0
      end

      def integer?
        !fload?
      end

      def bigendian?
        (format & MASK_ENDIAN) != 0
      end

      def littleendian?
        !big_endian?
      end

      def signed?
        (format & MASK_SIGNED) != 0
      end

      def unsigned?
        !signed?
      end
    end
  end
end
