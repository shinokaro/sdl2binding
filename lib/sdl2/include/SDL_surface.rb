module SDL2
  #
  # SDL_surface.h
  #
  require_relative 'SDL_stdinc'
  require_relative 'SDL_pixels'
  require_relative 'SDL_rect'
  require_relative 'SDL_blendmode'
  require_relative 'SDL_rwops'

  SDL_SWSURFACE = 0           # Just here for compatibility
  SDL_PREALLOC  = 0x00000001  # Surface uses preallocated memory
  SDL_RLEACCEL  = 0x00000002  # Surface is RLE encoded
  SDL_DONTFREE  = 0x00000004  # Surface is referenced internally

  SDL_MUSTLOCK = -> (s) { (s.flags & SDL_RLEACCEL) != 0 }

  SDL_Surface = struct([
      'Uint32 flags',               # Read-only
      'SDL_PixelFormat *format',    # Read-only
      'int w',                      # Read-only
      'int h',                      # Read-only
      'int pitch',                  # Read-only
      'void *pixels',               # Read-write
      # Application data associated with the surface
      'void *userdata',             # Read-write
      # information needed for surfaces requiring locks
      'int locked',                 # Read-only
      'void *lock_data',            # Read-only
      # clipping information
      'SDL_Rect clip_rect',         # Read-only
      # info for fast blit mapping to other surfaces
      'void *map',                  # Private (struct SDL_BlitMap)
      # Reference count -- used when freeing surface
      'int refcount'                # Read-mostly
  ])
  typealias 'SDL_Surface', 'void*'

  # typedef int (*SDL_blit) (struct SDL_Surface * src, SDL_Rect * srcrect,
  #                                         struct SDL_Surface * dst, SDL_Rect * dstrect);
  typealias 'SDL_blit', 'void*'

  extern 'SDL_Surface *SDL_CreateRGBSurface
    (Uint32 flags, int width, int height, int depth,
     Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)'
  extern 'SDL_Surface *SDL_CreateRGBSurfaceWithFormat
          (Uint32 flags, int width, int height, int depth, Uint32 format)'
  extern 'SDL_Surface *SDL_CreateRGBSurfaceFrom(void *pixels,
                                                int width,
                                                int height,
                                                int depth,
                                                int pitch,
                                                Uint32 Rmask,
                                                Uint32 Gmask,
                                                Uint32 Bmask,
                                                Uint32 Amask)'
  extern 'SDL_Surface *SDL_CreateRGBSurfaceWithFormatFrom
          (void *pixels, int width, int height, int depth, int pitch, Uint32 format)'
  extern 'void SDL_FreeSurface(SDL_Surface * surface)'
  extern 'int SDL_SetSurfacePalette(SDL_Surface * surface, SDL_Palette * palette)'
  extern 'int SDL_LockSurface(SDL_Surface * surface)'
  extern 'void SDL_UnlockSurface(SDL_Surface * surface)'
  extern 'SDL_Surface *SDL_LoadBMP_RW(SDL_RWops * src, int freesrc)'

  SDL_LoadBMP = -> (file) { SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1) }

  extern 'int SDL_SaveBMP_RW(SDL_Surface * surface, SDL_RWops * dst, int freedst)'

  SDL_SaveBMP = -> (surface, file) { SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1) }

  extern 'int SDL_SetSurfaceRLE(SDL_Surface * surface, int flag)'
  extern 'int SDL_SetColorKey(SDL_Surface * surface, int flag, Uint32 key)'
  extern 'int SDL_GetColorKey(SDL_Surface * surface, Uint32 * key)'
  extern 'int SDL_SetSurfaceColorMod(SDL_Surface * surface, Uint8 r, Uint8 g, Uint8 b)'
  extern 'int SDL_GetSurfaceColorMod(SDL_Surface * surface, Uint8 * r, Uint8 * g, Uint8 * b)'
  extern 'int SDL_SetSurfaceAlphaMod(SDL_Surface * surface, Uint8 alpha)'
  extern 'int SDL_GetSurfaceAlphaMod(SDL_Surface * surface, Uint8 * alpha)'
  extern 'int SDL_SetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode blendMode)'
  extern 'int SDL_GetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode *blendMode)'
  extern 'SDL_bool SDL_SetClipRect(SDL_Surface * surface, const SDL_Rect * rect)'
  extern 'void SDL_GetClipRect(SDL_Surface * surface, SDL_Rect * rect)'
  extern 'SDL_Surface *SDL_DuplicateSurface(SDL_Surface * surface)'
  extern 'SDL_Surface *SDL_ConvertSurface(SDL_Surface * src, const SDL_PixelFormat * fmt, Uint32 flags)'
  extern 'SDL_Surface *SDL_ConvertSurfaceFormat(SDL_Surface * src, Uint32 pixel_format, Uint32 flags)'
  extern 'int SDL_ConvertPixels(int width, int height,
                                Uint32 src_format, const void * src, int src_pitch,
                                Uint32 dst_format, void * dst, int dst_pitch)'
  extern 'int SDL_FillRect(SDL_Surface * dst, const SDL_Rect * rect, Uint32 color)'
  extern 'int SDL_FillRects(SDL_Surface * dst, const SDL_Rect * rects, int count, Uint32 color)'

  extern 'int SDL_UpperBlit(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)'
  extern 'int SDL_LowerBlit(SDL_Surface * src, SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)'
  extern 'int SDL_SoftStretch(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect)'
  # define SDL_BlitSurface SDL_UpperBlit
  class << self
    alias SDL_BlitSurface SDL_UpperBlit
  end

  extern 'int SDL_UpperBlitScaled(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)'
  extern 'int SDL_LowerBlitScaled(SDL_Surface * src, SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)'
  # define SDL_BlitScaled SDL_UpperBlitScaled
  class << self
    alias SDL_BlitScaled SDL_UpperBlitScaled
  end
end
