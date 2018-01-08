module SDL2
  module SDL_Version
    #
    # SDL_version.h
    #
    def included(m)
      m.module_eval {
        const_set :SDL_version, struct([
                                           'Uint8 major', # major version
                                           'Uint8 minor', # minor version
                                           'Uint8 patch'  # update version
                                       ])
        typealias 'SDL_version', 'void*'

        extern 'void        SDL_GetVersion(SDL_version * ver)'
        extern 'const char* SDL_GetRevision(void)'
        extern 'int         SDL_GetRevisionNumber(void)'
      }
    end
    module_function :included
  end
end
