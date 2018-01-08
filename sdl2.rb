require 'fiddle/import'
require 'fiddle/types'

module SDL2
  extend Fiddle::Importer
  dlload 'sdl2' # SDL2 lib path
  include Fiddle::BasicTypes

  require_relative './sdl2/SDL_stdinc'
  include SDL_Stdinc
  require_relative './sdl2/SDL_error'
  include SDL_Error
  require_relative './sdl2/SDL'
  include SDL
  require_relative './sdl2/SDL_clipboard'
  include SDL_Clipboard
  require_relative './sdl2/SDL_audio'
  include SDL_Audio
  require_relative './sdl2/SDL_power'
  include SDL_Power
  require_relative './sdl2/SDL_cpuinfo'
  include SDL_Cpuinfo
  require_relative './sdl2/SDL_timer'
  include SDL_Timer
  require_relative './sdl2/SDL_version'
  include SDL_Version
  require_relative './sdl2/SDL_video'
  include SDL_Video
  require_relative './sdl2/SDL_keyboard'
  include SDL_Keyboard
end
