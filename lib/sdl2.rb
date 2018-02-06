require 'fiddle/import'
require 'fiddle/types'
require 'forwardable'

module SDL2
  extend Fiddle::Importer
  dlload 'sdl2' # your SDL2 lib path
  include Fiddle::BasicTypes
  lp = File.join(File.expand_path(File.dirname(__FILE__)), "sdl2/include")
  Dir.each_child(lp) { |child| require_relative(File.join(lp, child)) }

  extend SingleForwardable

  require_relative 'sdl2/error'
  require_relative 'sdl2/version'
  def_delegators Version,
                 :version, :revision, :revision_number
  require_relative 'sdl2/init'
  def_delegator Init, :initialize
  def_delegator Init, :init?, :init_all?
  def_delegator Init, :init
  def_delegator Init, :quit
  def_delegator Init, :shutdown
  require_relative 'sdl2/audio_driver'
  require_relative 'sdl2/audio_device'
  require_relative 'sdl2/audio'
  def_delegator Audio, :init?, :init_audio?
  require_relative 'sdl2/video'
  def_delegator Video, :init?, :init_video?
  require_relative 'sdl2/display'
  require_relative 'sdl2/window'
  require_relative 'sdl2/screen_saver'
  require_relative 'sdl2/clipboard'
  extend Clipboard
  require_relative 'sdl2/event'
  def_delegator Event, :init?, :init_event?
  require_relative 'sdl2/event_filter'
  require_relative 'sdl2/keyboard'
  require_relative 'sdl2/mouse'
  require_relative 'sdl2/joystick'
  def_delegator Joystick, :init?, :init_joystick?
  require_relative 'sdl2/game_controller'
  def_delegator GameController, :init?, :init_game_controller?
  require_relative 'sdl2/haptic'
  def_delegator Haptic, :init?, :init_haptic?
  require_relative 'sdl2/timer'
  extend Timer
  def_delegator Timer, :init?, :init_timer?
  require_relative 'sdl2/info'
  extend Info
  require_relative 'sdl2/power_info'
end
