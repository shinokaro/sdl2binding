require 'fiddle/import'
require 'fiddle/types'

module SDL2
  class Error < StandardError; end

  extend Fiddle::Importer
  dlload 'sdl2' # your SDL2 lib path
  include Fiddle::BasicTypes
  lp = File.join(File.expand_path(File.dirname(__FILE__)), "sdl2/include")
  Dir.each_child(lp) { |child| require_relative(File.join(lp, child)) }

  require_relative 'sdl2/audio_driver'
  require_relative 'sdl2/audio_device'
  require_relative 'sdl2/audio'
  require_relative 'sdl2/video'
  require_relative 'sdl2/display'
  require_relative 'sdl2/window'

  require_relative 'sdl2/helper'

  include Helper

  def init(flags = SDL_INIT_EVERYTHING)
    error = SDL2.SDL_Init(flags)
    raise Error, error_msg if error < 0
  end
  module_function :init

  def init_sub_system(flags)
    error = SDL2.SDL_InitSubSystem(flags)
    raise Error, error_msg if error < 0
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
