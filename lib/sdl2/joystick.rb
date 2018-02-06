require_relative 'init_sub_system'

module SDL2
  module Joystick
    extend InitSubSystem

    def self.init_num
      SDL_INIT_JOYSTICK
    end
  end
end
