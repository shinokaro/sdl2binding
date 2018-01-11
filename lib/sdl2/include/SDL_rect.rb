module SDL2
  #
  # SDL_rect.h
  #
  require_relative 'SDL_stdinc'

  const_set :SDL_Point, struct(['int x', 'int y'])
  typealias 'SDL_Point', 'void*'

  const_set :SDL_Rect, struct(['int x', 'int y', 'int w', 'int h'])
  typealias 'SDL_Rect', 'void*'

  def self.SDL_PointInRect(sdl_point, sdl_rect)
    (sdl_point.x >= sdl_rect.x) && (sdl_point.x < sdl_rect.x + sdl_rect.w) &&
        (sdl_point.y >= sdl_rect.y) && (sdl_point.y < sdl_rect.y + sdl_rect.h) ? SDL_TRUE : SDL_FALSE
  end

  def self.SDL_RectEmpty(sdl_rect)
    ((!sdl_rect) || (sdl_rect.w <= 0) || (sdl_rect.h <= 0)) ? SDL_TRUE : SDL_FALSE
  end

  def self.SDL_RectEquals(sdl_rect_a, sdl_rect_b)
    (sdl_rect_a && sdl_rect_b && (sdl_rect_a.x == sdl_rect_b.x) && (sdl_rect_a.y == sdl_rect_b.y) &&
        (sdl_rect_a.w == sdl_rect_b.w) && (sdl_rect_a.h == sdl_rect_b.h)) ? SDL_TRUE : SDL_FALSE
  end

  extern 'SDL_bool SDL_HasIntersection(const SDL_Rect * A, const SDL_Rect * B)'
  extern 'SDL_bool SDL_IntersectRect(const SDL_Rect * A, const SDL_Rect * B, SDL_Rect * result)'
  extern 'void     SDL_UnionRect(const SDL_Rect * A, const SDL_Rect * B, SDL_Rect * result)'
  extern 'SDL_bool SDL_EnclosePoints(const SDL_Point * points, int count, const SDL_Rect * clip, SDL_Rect * result)'
  extern 'SDL_bool SDL_IntersectRectAndLine(const SDL_Rect *rect, int *X1, int *Y1, int *X2, int *Y2)'
end
