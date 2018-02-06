require_relative 'init_sub_system'

module SDL2
  module Timer
    extend InitSubSystem

    def self.init_num
      SDL_INIT_TIMER
    end

    def ticks_passed(a, b)
      SDL2::SDL_TICKS_PASSED[a, b]
    end

    def ticks
      SDL2.SDL_GetTicks.to_i
    end

    def performance_counter
      SDL2.SDL_GetPerformanceCounter.to_i
    end

    def performance_frequency
      SDL2.SDL_GetPerformanceFrequency.to_i
    end

    def delay(ms)
      SDL2.SDL_Delay(ms)
    end
  end
end
