require_relative 'init_sub_system'

module SDL2
  module GameController
    extend InitSubSystem

    def self.init_num
      SDL_INIT_GAMECONTROLLER
    end
  end
end
