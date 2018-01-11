module SDL2
  #
  # SDL_stdinc.h
  #

  #ifdef __cplusplus
  #define SDL_reinterpret_cast(type, expression) reinterpret_cast<type>(expression)
  #define SDL_static_cast(type, expression) static_cast<type>(expression)
  #define SDL_const_cast(type, expression) const_cast<type>(expression)
  #else
  #define SDL_reinterpret_cast(type, expression) ((type)(expression))
  #define SDL_static_cast(type, expression) ((type)(expression))
  #define SDL_const_cast(type, expression) ((type)(expression))
  #endif

  SDL_FOURCC = -> (a, b, c, d) {
    # ((SDL_static_cast(Uint32, SDL_static_cast(Uint8, (A))) << 0) |
    #  (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (B))) << 8) |
    #  (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (C))) << 16) |
    #  (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (D))) << 24))
  }

  SDL_FALSE = 0
  SDL_TRUE  = 1
  const_set :SDL_bool, [false, true].freeze
  typealias 'SDL_bool', 'int'

  SDL_MAX_SINT8  = 0x7F         # 127
  SDL_MIN_SINT8  = ~0x7F        # -128
  SDL_MAX_UINT8  = 0xFF         # 255
  SDL_MIN_UINT8  = 0x00         # 0
  SDL_MAX_SINT16 = 0x7FFF       # 32767
  SDL_MIN_SINT16 = ~0x7FFF      # -32768
  SDL_MAX_UINT16 = 0xFFFF       # 65535
  SDL_MIN_UINT16 = 0x0000       # 0
  SDL_MAX_SINT32 = 0x7FFF_FFFF  # 2147483647
  SDL_MIN_SINT32 = ~0x7FFF_FFFF # -2147483648
  SDL_MAX_UINT32 = 0xFFFF_FFFF  # 4294967295
  SDL_MIN_UINT32 = 0x0000_0000  # 0
  SDL_MAX_SINT64 = 0x7FFF_FFFF_FFFF_FFFF  # 9223372036854775807
  SDL_MIN_SINT64 = ~0x7FFF_FFFF_FFFF_FFFF # -9223372036854775808
  SDL_MAX_UINT64 = 0xFFFF_FFFF_FFFF_FFFF  # 18446744073709551615
  SDL_MIN_UINT64 = 0x0000_0000_0000_0000  # 0

  typealias 'Sint8',  'char'
  typealias 'Uint8',  'unsigned char'
  typealias 'Sint16', 'short'
  typealias 'Uint16', 'unsigned short'
  typealias 'Sint32', 'int'
  typealias 'Uint32', 'unsigned int'
  typealias 'Sint64', 'long long'
  typealias 'Uint64', 'unsigned long long'

  extern 'void SDL_free(void *mem)'
end
