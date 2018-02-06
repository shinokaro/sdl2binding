require_relative 'init_sub_system'

module SDL2
  module Haptic
    extend InitSubSystem

    def self.init_num
      SDL_INIT_HAPTIC
    end
  end
end
