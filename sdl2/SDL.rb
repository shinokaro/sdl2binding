module SDL2
  module SDL
    #
    # SDL.h
    #
    SDL_INIT_TIMER          = 0x00000001
    SDL_INIT_AUDIO          = 0x00000010
    SDL_INIT_VIDEO          = 0x00000020
    SDL_INIT_JOYSTICK       = 0x00000200
    SDL_INIT_HAPTIC         = 0x00001000
    SDL_INIT_GAMECONTROLLER = 0x00002000
    SDL_INIT_EVENTS         = 0x00004000
    SDL_INIT_NOPARACHUTE    = 0x00100000
    SDL_INIT_EVERYTHING     = SDL_INIT_TIMER | SDL_INIT_AUDIO |
                              SDL_INIT_VIDEO | SDL_INIT_EVENTS |
                              SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC |
                              SDL_INIT_GAMECONTROLLER

    def included(m)
      m.module_eval{
        extern 'int    SDL_Init(Uint32 flags)'
        extern 'int    SDL_InitSubSystem(Uint32 flags)'
        extern 'void   SDL_QuitSubSystem(Uint32 flags)'
        extern 'Uint32 SDL_WasInit(Uint32 flags)'
        extern 'void   SDL_Quit(void)'
      }
    end
    module_function :included
  end
end
