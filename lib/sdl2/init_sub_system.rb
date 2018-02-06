module SDL2
  module InitSubSystem
    class << self
      def init_any?(flags)
        SDL2.SDL_WasInit(flags) == flags
      end

      def init_any(flags)
        unless init_any?(flags)
          error = SDL2.SDL_InitSubSystem(flags)
          raise Error if error < 0
        end
      end

      def quit_any(flags)
        SDL2.SDL_QuitSubSystem(flags)
      end
    end

    def init?
      InitSubSystem.init_any?(init_num)
    end

    def init
      InitSubSystem.init_any(init_num)
    end

    def quit
      InitSubSystem.quit_any(init_num)
    end
  end
end