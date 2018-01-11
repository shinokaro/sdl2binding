module SDL2
  #
  # SDL_render.h
  #
  require_relative 'SDL_stdinc'
  require_relative 'SDL_rect'
  require_relative 'SDL_video'

  # Enum: SDL_RendererFlags
  SDL_RENDERER_SOFTWARE      = 0x00000001 # The renderer is a software fallback
  SDL_RENDERER_ACCELERATED   = 0x00000002 # The renderer uses hardware acceleration
  SDL_RENDERER_PRESENTVSYNC  = 0x00000004 # Present is synchronized with the refresh rate
  SDL_RENDERER_TARGETTEXTURE = 0x00000008 # The renderer supports rendering to texture
  typealias 'SDL_RendererFlags', 'int'

  const_set :SDL_RendererInfo, struct([
      'const char *name',           # The name of the renderer
      'Uint32 flags',               # Supported ::SDL_RendererFlags
      'Uint32 num_texture_formats', # The number of available texture formats
      'Uint32 texture_formats[16]', # The available texture formats
      'int max_texture_width',      # The maximum texture width
      'int max_texture_height'      # The maximum texture height

  ])
  typealias 'SDL_RendererInfo', 'void*'

  # Enum: SDL_TextureAccess
  SDL_TEXTUREACCESS_STATIC    = 0 # Changes rarely, not lockable
  SDL_TEXTUREACCESS_STREAMING = 1 # Changes frequently, lockable
  SDL_TEXTUREACCESS_TARGET    = 2 # Texture can be used as a render target
  typealias 'SDL_TextureAccess', 'int'

  # Enum: SDL_TextureModulate
  SDL_TEXTUREMODULATE_NONE  = 0x00000000 # No modulation
  SDL_TEXTUREMODULATE_COLOR = 0x00000001 # srcC = srcC * color
  SDL_TEXTUREMODULATE_ALPHA = 0x00000002 # srcA = srcA * alpha
  typealias 'SDL_TextureModulate', 'int'

  # Enum: SDL_RendererFlip
  SDL_FLIP_NONE       = 0x00000000 # Do not flip
  SDL_FLIP_HORIZONTAL = 0x00000001 # flip horizontally
  SDL_FLIP_VERTICAL   = 0x00000002 # flip vertically
  typealias 'SDL_RendererFlip', 'int'

  typealias 'SDL_Renderer', 'void*'
  typealias 'SDL_Texture',  'void*'

  extern 'int SDL_GetNumRenderDrivers(void)'
  extern 'int SDL_GetRenderDriverInfo(int index, SDL_RendererInfo * info)'
  extern 'int SDL_CreateWindowAndRenderer(int width, int height, Uint32 window_flags, SDL_Window **window, SDL_Renderer **renderer)'
  extern 'SDL_Renderer * SDL_CreateRenderer(SDL_Window * window, int index, Uint32 flags)'
  extern 'SDL_Renderer * SDL_CreateSoftwareRenderer(SDL_Surface * surface)'
  extern 'SDL_Renderer * SDL_GetRenderer(SDL_Window * window)'
  extern 'int SDL_GetRendererInfo(SDL_Renderer * renderer, SDL_RendererInfo * info)'
  extern 'int SDL_GetRendererOutputSize(SDL_Renderer * renderer, int *w, int *h)'
  extern 'SDL_Texture * SDL_CreateTexture(SDL_Renderer * renderer, Uint32 format, int access, int w, int h)'
  extern 'SDL_Texture * SDL_CreateTextureFromSurface(SDL_Renderer * renderer, SDL_Surface * surface)'
  extern 'int SDL_QueryTexture(SDL_Texture * texture, Uint32 * format, int *access, int *w, int *h)'
  extern 'int SDL_SetTextureColorMod(SDL_Texture * texture, Uint8 r, Uint8 g, Uint8 b)'
  extern 'int SDL_GetTextureColorMod(SDL_Texture * texture, Uint8 * r, Uint8 * g, Uint8 * b)'
  extern 'int SDL_SetTextureAlphaMod(SDL_Texture * texture, Uint8 alpha)'
  extern 'int SDL_GetTextureAlphaMod(SDL_Texture * texture, Uint8 * alpha)'
  extern 'int SDL_SetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode blendMode)'
  extern 'int SDL_GetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode *blendMode)'
  extern 'int SDL_UpdateTexture(SDL_Texture * texture, const SDL_Rect * rect, const void *pixels, int pitch)'
  extern 'int SDL_UpdateYUVTexture(SDL_Texture * texture, const SDL_Rect * rect, const Uint8 *Yplane, int Ypitch, const Uint8 *Uplane, int Upitch, const Uint8 *Vplane, int Vpitch)'
  extern 'int SDL_LockTexture(SDL_Texture * texture, const SDL_Rect * rect, void **pixels, int *pitch)'
  extern 'void SDL_UnlockTexture(SDL_Texture * texture)'
  extern 'SDL_bool SDL_RenderTargetSupported(SDL_Renderer *renderer)'
  extern 'int SDL_SetRenderTarget(SDL_Renderer *renderer, SDL_Texture *texture)'
  extern 'SDL_Texture * SDL_GetRenderTarget(SDL_Renderer *renderer)'
  extern 'int SDL_RenderSetLogicalSize(SDL_Renderer * renderer, int w, int h)'
  extern 'void SDL_RenderGetLogicalSize(SDL_Renderer * renderer, int *w, int *h)'
  extern 'int SDL_RenderSetIntegerScale(SDL_Renderer * renderer, SDL_bool enable)'
  extern 'SDL_bool SDL_RenderGetIntegerScale(SDL_Renderer * renderer)'
  extern 'int SDL_RenderSetViewport(SDL_Renderer * renderer, const SDL_Rect * rect)'
  extern 'void SDL_RenderGetViewport(SDL_Renderer * renderer, SDL_Rect * rect)'
  extern 'int SDL_RenderSetClipRect(SDL_Renderer * renderer, const SDL_Rect * rect)'
  extern 'void SDL_RenderGetClipRect(SDL_Renderer * renderer, SDL_Rect * rect)'
  extern 'SDL_bool SDL_RenderIsClipEnabled(SDL_Renderer * renderer)'
  extern 'int SDL_RenderSetScale(SDL_Renderer * renderer, float scaleX, float scaleY)'
  extern 'void SDL_RenderGetScale(SDL_Renderer * renderer, float *scaleX, float *scaleY)'
  extern 'int SDL_SetRenderDrawColor(SDL_Renderer * renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)'
  extern 'int SDL_GetRenderDrawColor(SDL_Renderer * renderer, Uint8 * r, Uint8 * g, Uint8 * b, Uint8 * a)'
  extern 'int SDL_SetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode blendMode)'
  extern 'int SDL_GetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode *blendMode)'
  extern 'int SDL_RenderClear(SDL_Renderer * renderer)'
  extern 'int SDL_RenderDrawPoint(SDL_Renderer * renderer, int x, int y)'
  extern 'int SDL_RenderDrawPoints(SDL_Renderer * renderer, const SDL_Point * points, int count)'
  extern 'int SDL_RenderDrawLine(SDL_Renderer * renderer, int x1, int y1, int x2, int y2)'
  extern 'int SDL_RenderDrawLines(SDL_Renderer * renderer, const SDL_Point * points, int count)'
  extern 'int SDL_RenderDrawRect(SDL_Renderer * renderer, const SDL_Rect * rect)'
  extern 'int SDL_RenderDrawRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count)'
  extern 'int SDL_RenderFillRect(SDL_Renderer * renderer, const SDL_Rect * rect)'
  extern 'int SDL_RenderFillRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count)'
  extern 'int SDL_RenderCopy(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_Rect * dstrect)'
  extern 'int SDL_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture,
                          SDL_Rect *srcrect, SDL_Rect *dstrect,
                          double angle, SDL_Point *center,
                          SDL_RendererFlip flip)'
  extern 'int SDL_RenderReadPixels(SDL_Renderer * renderer, const SDL_Rect * rect, Uint32 format, void *pixels, int pitch)'
  extern 'void SDL_RenderPresent(SDL_Renderer * renderer)'
  extern 'void SDL_DestroyTexture(SDL_Texture * texture)'
  extern 'void SDL_DestroyRenderer(SDL_Renderer * renderer)'
  extern 'int SDL_GL_BindTexture(SDL_Texture *texture, float *texw, float *texh)'
  extern 'int SDL_GL_UnbindTexture(SDL_Texture *texture)'
end
