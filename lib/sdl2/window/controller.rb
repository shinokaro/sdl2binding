module SDL2
  class Window
    module Controller
      def bordered=(bordered)
        SDL2.SDL_SetWindowBordered(window, bordered ? 1 : 0)
      end

      def resizable=(resizable)
        SDL2.SDL_SetWindowResizable(window, resizable ? 1 : 0)
      end

      def show
        SDL2.SDL_ShowWindow(window)
      end

      def hide
        SDL2.SDL_HideWindow(window)
      end

      def raise_window
        SDL2.SDL_RaiseWindow(window)
      end

      def maximize
        SDL2.SDL_MaximizeWindow(window)
      end

      def minimize
        SDL2.SDL_MinimizeWindow(window)
      end

      def restore
        SDL2.SDL_RestoreWindow(window)
      end

      def grab=(grabbed)
        SDL2.SDL_SetWindowGrab(window, grabbed)
      end

      def grab
        SDL_bool[SDL2.SDL_GetWindowGrab(window)]
      end
    end
  end
end
