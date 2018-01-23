module SDL2
  module Timer
    def ticks_passed(a, b)
      SDL2::SDL_TICKS_PASSED[a, b]
    end
    module_function :ticks_passed

    def ticks
      SDL2.SDL_GetTicks.to_i
    end
    module_function :ticks

    def performance_counter
      SDL2.SDL_GetPerformanceCounter.to_i
    end
    module_function :performance_counter

    def performance_frequency
      SDL2.SDL_GetPerformanceFrequency.to_i
    end
    module_function :performance_frequency

    def delay(ms)
      SDL2.SDL_Delay(ms)
    end
    module_function :delay
  end
end
