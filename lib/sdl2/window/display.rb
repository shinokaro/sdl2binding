require_relative '../pointer'

module SDL2
  class Window
    module Display
      def display
        SDL2::Display.new(SDL2.SDL_GetWindowDisplayIndex(window))
      end

      def display_mode_for_fullscreen=(mode)
        error = SDL2.SDL_SetWindowDisplayMode(window, mode)
        raise Error if error < 0
      end

      def display_mode_for_fullscreen
        mode = SDL_DisplayMode.new
        error = SDL2.SDL_GetWindowDisplayMode(window, mode)
        raise Error if error < 0
        mode
      end

      def display_brightness=(brightness)
        error = SDL2.SDL_SetWindowBrightness(window, brightness.to_f)
        raise Error if error < 0
      end

      def display_brightness
        SDL2.SDL_GetWindowBrightness(window)
      end
      #
      # GammaRamp
      # [[R, ...],[G, ...],[B, ...]]
      #
      def display_gamma_ramp=(gamma_maps)
        red, green, blue = gamma_maps.map { |ary| ary.pack('S!256') }
        error = SDL2.SDL_SetWindowGammaRamp(window, red, green, blue)
        raise Error if error < 0
      end

      def display_gamma_ramp
        red, green, blue = GammaRampPointer.new, GammaRampPointer.new, GammaRampPointer.new
        error = SDL2.SDL_GetWindowGammaRamp(window, red, green, blue)
        raise Error if error < 0
        [red.values, green.values, blue.values]
      end
    end
  end
end
