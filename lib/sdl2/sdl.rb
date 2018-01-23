module SDL2
  module SDL
    def init(flags = SDL_INIT_EVERYTHING)
      error = SDL2.SDL_Init(flags)
      raise Error if error < 0
    end
    module_function :init

    def init_sub_system(flags)
      error = SDL2.SDL_InitSubSystem(flags)
      raise Error if error < 0
    end
    module_function :init_sub_system

    def quit_sub_system(flags)
      SDL2.SDL_QuitSubSystem(flags)
    end
    module_function :quit_sub_system

    def was_init(flags)
      SDL2.SDL_WasInit(flags) # UINT32(flags)
    end
    module_function :was_init

    def quit
      SDL2.SDL_Quit
    end
    module_function :quit
  end
end