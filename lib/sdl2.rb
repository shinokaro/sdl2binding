require 'fiddle/import'
require 'fiddle/types'
require 'forwardable'

module SDL2
  class Error < StandardError
    class << self
      def clear
        SDL2.SDL_ClearError
      end
    end

    def clear
      SDL2.SDL_ClearError
    end

    def to_s
      SDL2.SDL_GetError.to_s
    end
  end

  extend Fiddle::Importer
  dlload 'sdl2' # your SDL2 lib path
  include Fiddle::BasicTypes
  lp = File.join(File.expand_path(File.dirname(__FILE__)), "sdl2/include")
  Dir.each_child(lp) { |child| require_relative(File.join(lp, child)) }

  extend SingleForwardable

  require_relative 'sdl2/version'
  def_delegators Version,
                 :version, :revision, :revision_number
  require_relative 'sdl2/sdl'
  def_delegators SDL,
                 :init, :init_sub_system, :quit_sub_system, :was_init, :quit
  require_relative 'sdl2/audio_driver'
  require_relative 'sdl2/audio_device'
  require_relative 'sdl2/audio'
  require_relative 'sdl2/video'
  require_relative 'sdl2/display'
  require_relative 'sdl2/window'
  require_relative 'sdl2/clipboard'
  def_delegators Clipboard,
                 :clipboard_text=, :clipboard_text, :clipboard_text?
  require_relative 'sdl2/timer'
  def_delegators Timer,
                 :ticks_passed, :ticks, :performance_counter, :performance_frequency, :delay
  require_relative 'sdl2/info'
  def_delegators Info,
                 :platform, :cpu_count, :cpu_cache_line_size, :system_ram,
                 :has_rdtsc?, :has_alti_vec?, :has_mmx?, :has_3d_now?,
                 :has_sse?, :has_sse2?, :has_sse3?, :has_sse41?, :has_sse42?,
                 :has_avx?, :has_neon?
  require_relative 'sdl2/power_info'
end
