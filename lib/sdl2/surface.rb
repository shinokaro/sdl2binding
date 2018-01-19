require_relative 'pointer'
require_relative 'helper'
require_relative 'rect'

module SDL2
  class Surface
    class << self
      # SDL_Surface *SDL_LoadBMP_RW(SDL_RWops * src, int freesrc)
      #
      # SDL_LoadBMP = -> (file) { SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1) }
      def load_bmp(file)
        File.open(file, 'rb') { |f|
          rw_ops = SDL2.SDL_RWFromFP(f.to_i, 0)

          SDL2.SDL_LoadBMP_RW(rw_ops, 0)
        } #=> SDL_Surface
      end
      #
      # int SDL_SaveBMP_RW(SDL_Surface * surface, SDL_RWops * dst, int freedst)
      #
      # SDL_SaveBMP = -> (surface, file) { SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1) }

      # SDL_Surface *SDL_CreateRGBSurface
      def create_surface(width, height, depth = 32, r_mask = 0, g_mask = 0, b_mask = 0, a_mask = 0)
        surface = SDL2.SDL_CreateRGBSurface(0, width, height, depth, r_mask, g_mask, b_mask, a_mask)
        raise "#{SDL2.SDL_GetError}" if surface.to_i == 0
        surface
      end
      # SDL_Surface *SDL_CreateRGBSurfaceWithFormat
      def create_surface_with_format(width, height, depth, format)
        surface = SDL2.SDL_CreateRGBSurfaceWithFormat(0, width, height, depth, format)
        raise "#{SDL2.SDL_GetError}" if surface.to_i == 0
        surface
      end
      # SDL_Surface *SDL_CreateRGBSurfaceFrom
      def create_surface_from(pixels, width, height, depth, r_mask, g_mask, b_mask, a_mask)
        surface = SDL2.SDL_CreateRGBSurfaceFrom(pixels, width, height, depth, r_mask, g_mask, b_mask, a_mask)
        raise "#{SDL2.SDL_GetError}" if surface.to_i == 0
        surface
      end
      # SDL_Surface *SDL_CreateRGBSurfaceWithFormatFrom
      def create_surface_with_format_from(pixels, width, height, depth, format)
        surface = SDL2.SDL_CreateRGBSurfaceWithFormatFrom(pixels, width, height, depth, format)
        raise "#{SDL2.SDL_GetError}" if surface.to_i == 0
        surface
      end
    end

    def initialize(surface)
      @surface = surface
    end

    # int SDL_SetSurfacePalette(SDL_Surface * surface, SDL_Palette * palette)
    #
    # int SDL_SetSurfaceRLE(SDL_Surface * surface, int flag)
    #

    def color_key=(key)
      # key カラーキーはsurfaceのピクセル形式で, SDL_MapRGB()で生成できる
      flag = key ? SDL2::SDL_TRUE : SDL2::SDL_FALSE
      error = SDL2.SDL_SetColorKey(@surface, flag, key)
      raise Error, error_msg if error < 0
    end

    def color_key
      key = Uint32Pointer.new
      error = SDL2.SDL_GetColorKey(@surface, key)
      raise Error, error_msg if error < 0
      key.value
    end

    def color_mod=(r_g_b)
      r, g, b = r_g_b
      error = SDL2.SDL_SetSurfaceColorMod(@surface, r, g, b)
    end

    def color_mod
      r, g, b = Uint8Pointer.new, Uint8Pointer.new, Uint8Pointer.new
      error = SDL2.SDL_GetSurfaceColorMod(@surface, r, g, b)
      [r.value, g.value, b.value]
    end

    def alpha_mod=(alpha)
      error = SDL2.SDL_SetSurfaceAlphaMod(@surface, alpha)
      raise Error, error_msg if error < 0
    end

    def alpha_mod
      alpha = Uint8Pointer.new
      error = SDL2.SDL_GetSurfaceAlphaMod(@surface, alpha)
      raise Error, error_msg if error < 0
      alpha.value
    end

    def blend_mode=(blend_mode)
      blend_mode ||= SDL_BLENDMODE_NONE
      error = SDL2.SDL_SetSurfaceBlendMode(@surface, blend_mode)
      raise Error, error_msg if error < 0
    end

    def blend_mode
      blend_mode = IntPointer.new
      error = SDL2.SDL_GetSurfaceBlendMode(@surface, blend_mode)
      raise Error, error_msg if error < 0
      blend_mode.value
    end
    #
    # SDL_bool SDL_SetClipRect(SDL_Surface * surface, const SDL_Rect * rect)
    # void SDL_GetClipRect(SDL_Surface * surface, SDL_Rect * rect)
    #
    # SDL_Surface *SDL_DuplicateSurface(SDL_Surface * surface)
    # SDL_Surface *SDL_ConvertSurface(SDL_Surface * src, const SDL_PixelFormat * fmt, Uint32 flags)
    # SDL_Surface *SDL_ConvertSurfaceFormat(SDL_Surface * src, Uint32 pixel_format, Uint32 flags)
    # int SDL_ConvertPixels(int width, int height,
    #                             Uint32 src_format, const void * src, int src_pitch,
    #                             Uint32 dst_format, void * dst, int dst_pitch)
    # int SDL_FillRect(SDL_Surface * dst, const SDL_Rect * rect, Uint32 color)
    def fill_rect(rect, color)
      error = SDL2.SDL_FillRect(@surface, rect, color)
      raise Error, error_msg if error < 0
      self
    end
    #
    # int SDL_FillRects(SDL_Surface * dst, const SDL_Rect * rects, int count, Uint32 color)

    def copy

    end

    # int SDL_UpperBlit(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)
    def paste(src, rect = nil, x: 0, y: 0, w: 0, h: 0)
      # SDL2.SDL_UpperBlit(src, srcrect, @surface, dst_rect)
      blit_surface(src, src_rect, dst_rect)
    end

    def blit_surface(src, src_rect, dst_rect)
      error = SDL2.SDL_UpperBlit(src, src_rect, @surface, dst_rect)
    end

    def to_i
      @surface.to_i
    end
    # int SDL_SoftStretch(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect)
    #
    # int SDL_UpperBlitScaled(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)
    #
    #
    def free
      #
      # Window#surface からの場合開放してはならない。
      # その場合、ウィンドウのサイズ変更で勝手に破棄される。
      # さて、どうする？
      SDL_FreeSurface(@surface)
    end

    # def lock
    #   error = SDL2.SDL_LockSurface(@surface)
    #   raise Error, error_msg if error < 0
    # end
    #
    # def unlock
    #   SDL2.SDL_UnlockSurface(@surface)
    # end
  end
end