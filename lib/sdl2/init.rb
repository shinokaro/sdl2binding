require_relative 'init_sub_system'

module SDL2
  module Init
    extend InitSubSystem

    def self.init_num
      SDL_INIT_EVERYTHING
    end

    def self.initialize
      # Init(0)は本当に必要なのか？
      # OSによるのか？
      # dlopen用のメソッドになるのか？
      error = SDL2.SDL_Init(0)
      raise Error if error < 0
    end

    def self.shutdown
      SDL2.SDL_Quit
    end
  end
end
