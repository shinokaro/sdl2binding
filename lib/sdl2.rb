require 'fiddle/import'
require 'fiddle/types'

module SDL2
  extend Fiddle::Importer
  dlload 'sdl2' # your SDL2 lib path
  include Fiddle::BasicTypes
  lp = File.join(File.expand_path(File.dirname(__FILE__)), "sdl2/include")
  Dir.each_child(lp) { |child| require_relative File.join(lp, child) }
  require_relative 'sdl2/audio_device'
end
