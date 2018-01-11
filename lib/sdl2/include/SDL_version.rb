module SDL2
  #
  # SDL_version.h
  #
  require_relative 'SDL_stdinc'

  const_set :SDL_version, struct([
      'Uint8 major', # major version
      'Uint8 minor', # minor version
      'Uint8 patch'  # update version
  ])
  typealias 'SDL_version', 'void*'

  extern 'void        SDL_GetVersion(SDL_version * ver)'
  extern 'const char* SDL_GetRevision(void)'
  extern 'int         SDL_GetRevisionNumber(void)'
end
