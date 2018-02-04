require_relative '../pointer'

module SDL2
  class Window
    module Accessor
      def []=(name, userdata)
        SDL2.SDL_SetWindowData(window, name, userdata)
      end

      def [](name)
        SDL2.SDL_GetWindowData(window, name) #=> void pointer
      end

      def icon=(icon)
        # icon is SDL_Surface
        SDL2.SDL_SetWindowIcon(window, icon)
      end

      def title=(title)
        SDL2.SDL_SetWindowTitle(window, title)
      end

      def title
        char = SDL2.SDL_GetWindowTitle(window)
        char.to_s.force_encoding('UTF-8')
      end

      def position=(x_y)
        x, y = x_y
        SDL2.SDL_SetWindowPosition(window, x || SDL_WINDOWPOS_CENTERED, y || SDL_WINDOWPOS_CENTERED)
      end

      def position
        x, y = IntPointer.new, IntPointer.new
        SDL2.SDL_GetWindowPosition(window, x, y)
        [x.value, y.value]
      end

      def x=(x)
        SDL2.SDL_SetWindowPosition(window, x || SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_UNDEFINED)
      end

      def x
        x = IntPointer.new
        SDL2.SDL_GetWindowPosition(window, x, nil)
        x.value
      end

      def y=(y)
        SDL2.SDL_SetWindowPosition(window, SDL_WINDOWPOS_UNDEFINED, y || SDL_WINDOWPOS_CENTERED)
      end

      def y
        y = IntPointer.new
        SDL2.SDL_GetWindowPosition(window, nil, y)
        y.value
      end

      def size=(w, h)
        SDL2.SDL_SetWindowSize(window, w, h)
      end

      def size
        w, h = IntPointer.new, IntPointer.new
        SDL2.SDL_GetWindowSize(window, w, h)
        [w.value, h.value]
      end

      def w=(w)
        SDL2.SDL_SetWindowSize(window, w, h)
      end

      alias width= w=

      def w
        w = IntPointer.new
        SDL2.SDL_GetWindowSize(window, w, nil)
        w.value
      end

      alias width w

      def h=(h)
        SDL2.SDL_SetWindowSize(window, w, h)
      end

      alias height= h=

      def h
        h = IntPointer.new
        SDL2.SDL_GetWindowSize(window, nil, h)
        h.value
      end

      alias height h

      def minimum_size=(min_w_h)
        min_w, min_h = min_w_h
        SDL2.SDL_SetWindowMinimumSize(window, min_w, min_h)
      end

      def minimum_size
        w, h = IntPointer.new, IntPointer.new
        SDL2.SDL_GetWindowMinimumSize(window, w, h)
        [w.value, h.value]
      end

      def maximum_size=(max_w_h)
        max_w, max_h = max_w_h
        SDL2.SDL_SetWindowMaximumSize(window, max_w, max_h)
      end

      def maximum_size
        w, h = IntPointer.new, IntPointer.new
        SDL2.SDL_GetWindowMaximumSize(window, w, h)
        [w.value, h.value]
      end

      def opacity=(opacity)
        error = SDL2.SDL_SetWindowOpacity(window, opacity.to_f)
        raise Error if error != -1 && error < 0
      end

      def opacity
        out_opacity = FloatPointer.new
        error = SDL2.SDL_GetWindowOpacity(window, out_opacity)
        raise Error if error < 0
        out_opacity.value
      end
    end
  end
end
