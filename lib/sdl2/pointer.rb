require 'fiddle/import'

module SDL2
  module Pointer
    def pointer(size, format, free = Fiddle::RUBY_FREE)
      class_eval <<~EOT
        def initialize
          @ptr = Fiddle::Pointer.malloc(#{size}, #{free})
        end

        def value
          @ptr.to_str.unpack('#{format}').first
        end

        def values
          @ptr.to_str.unpack('#{format}')
        end

        def to_i
          @ptr.to_i
        end
      EOT
    end
  end

  class IntPointer
    extend Pointer
    pointer Fiddle::SIZEOF_INT, 'i!'
  end

  class Uint8Pointer
    extend Pointer
    pointer Fiddle::SIZEOF_CHAR, 'C'
  end

  class Uint16Pointer
    extend Pointer
    pointer Fiddle::SIZEOF_DOUBLE, 'S!'
  end

  class Uint32Pointer
    extend Pointer
    pointer Fiddle::SIZEOF_INT, 'I!'
  end

  class FloatPointer
    extend Pointer
    pointer Fiddle::SIZEOF_FLOAT, 'f'
  end

  class GammaRampPointer
    extend Pointer
    pointer (Fiddle::SIZEOF_SHORT * 256), 'S!*'
  end
end
