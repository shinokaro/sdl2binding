require 'forwardable'

module SDL2
  class Rect
    extend Forwardable

    def_delegators :@rect, :x, :y, :w, :h, :to_i

    def initialize(x: 0, y: 0, w: 0, h: 0)
      rect = SDL_Rect.malloc
      rect.x = x
      rect.y = y
      rect.w = w
      rect.h = h
      @rect = rect
    end
  end
end