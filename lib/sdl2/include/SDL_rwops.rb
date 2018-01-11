module SDL2
  #
  # SDL_rwops.h
  #
  require_relative 'SDL_stdinc'

  SDL_RWOPS_UNKNOWN   = 0 # Unknown stream type
  SDL_RWOPS_WINFILE   = 1 # Win32 file
  SDL_RWOPS_STDFILE   = 2 # Stdio file
  SDL_RWOPS_JNIFILE   = 3 # Android asset
  SDL_RWOPS_MEMORY    = 4 # Memory stream
  SDL_RWOPS_MEMORY_RO = 5 # Read-Only memory stream

  # typedef struct SDL_RWops
  typealias 'SDL_RWops', 'int'

  extern 'SDL_RWops *SDL_RWFromFile(const char *file, const char *mode)'
  extern 'SDL_RWops *SDL_RWFromFP(void * fp, SDL_bool autoclose)'
  extern 'SDL_RWops *SDL_RWFromMem(void *mem, int size)'
  extern 'SDL_RWops *SDL_RWFromConstMem(const void *mem, int size)'
  extern 'SDL_RWops *SDL_AllocRW(void)'
  extern 'void SDL_FreeRW(SDL_RWops * area)'

  RW_SEEK_SET = 0 # Seek from the beginning of data
  RW_SEEK_CUR = 1 # Seek relative to current read point
  RW_SEEK_END = 2 # Seek relative to the end of data

  #define SDL_RWsize(ctx)         (ctx)->size(ctx)
  #define SDL_RWseek(ctx, offset, whence) (ctx)->seek(ctx, offset, whence)
  #define SDL_RWtell(ctx)         (ctx)->seek(ctx, 0, RW_SEEK_CUR)
  #define SDL_RWread(ctx, ptr, size, n)   (ctx)->read(ctx, ptr, size, n)
  #define SDL_RWwrite(ctx, ptr, size, n)  (ctx)->write(ctx, ptr, size, n)
  #define SDL_RWclose(ctx)        (ctx)->close(ctx)

  extern 'void *SDL_LoadFile_RW(SDL_RWops * src, size_t *datasize, int freesrc)'

  SDL_LoadFile = -> (file, datasize) { SDL_LoadFile_RW(SDL_RWFromFile(file, "rb"), datasize, 1) }

  extern 'Uint8 SDL_ReadU8(SDL_RWops * src)'
  extern 'Uint16 SDL_ReadLE16(SDL_RWops * src)'
  extern 'Uint16 SDL_ReadBE16(SDL_RWops * src)'
  extern 'Uint32 SDL_ReadLE32(SDL_RWops * src)'
  extern 'Uint32 SDL_ReadBE32(SDL_RWops * src)'
  extern 'Uint64 SDL_ReadLE64(SDL_RWops * src)'
  extern 'Uint64 SDL_ReadBE64(SDL_RWops * src)'
  extern 'size_t SDL_WriteU8(SDL_RWops * dst, Uint8 value)'
  extern 'size_t SDL_WriteLE16(SDL_RWops * dst, Uint16 value)'
  extern 'size_t SDL_WriteBE16(SDL_RWops * dst, Uint16 value)'
  extern 'size_t SDL_WriteLE32(SDL_RWops * dst, Uint32 value)'
  extern 'size_t SDL_WriteBE32(SDL_RWops * dst, Uint32 value)'
  extern 'size_t SDL_WriteLE64(SDL_RWops * dst, Uint64 value)'
  extern 'size_t SDL_WriteBE64(SDL_RWops * dst, Uint64 value)'
end