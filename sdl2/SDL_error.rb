module SDL2
  module SDL_Error
    #
    # SDL_error.h
    #
    def included(m)
      m.module_eval {
        extern 'const char *SDL_GetError(void)'
        extern 'void        SDL_ClearError(void)'
      }
    end
    module_function :included
  end
end