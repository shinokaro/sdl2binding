module SDL2
  module Info
    #
    # SDL_cpuinfo
    #
    def cpu_count
      SDL2.SDL_GetCPUCount.to_i
    end
    module_function :cpu_count

    def cpu_cache_line_size
      SDL2.SDL_GetCPUCacheLineSize.to_i
    end
    module_function :cpu_cache_line_size

    def has_rdtsc?
      SDL_bool[SDL2.SDL_HasRDTSC]
    end
    module_function :has_rdtsc?

    def has_alti_vec?
      SDL_bool[SDL2.SDL_HasAltiVec]
    end
    module_function :has_alti_vec?

    def has_mmx?
      SDL_bool[SDL2.SDL_HasMMX]
    end
    module_function :has_mmx?

    def has_3d_now?
      SDL_bool[SDL2.SDL_Has3DNow]
    end
    module_function :has_3d_now?

    def has_sse?
      SDL_bool[SDL2.SDL_HasSSE]
    end
    module_function :has_sse?

    def has_sse2?
      SDL_bool[SDL2.SDL_HasSSE2]
    end
    module_function :has_sse2?

    def has_sse3?
      SDL_bool[SDL2.SDL_HasSSE3]
    end
    module_function :has_sse3?

    def has_sse41?
      SDL_bool[SDL2.SDL_HasSSE41]
    end
    module_function :has_sse41?

    def has_sse42?
      SDL_bool[SDL2.SDL_HasSSE42]
    end
    module_function :has_sse42?

    def has_avx?
      SDL_bool[SDL2.SDL_HasAVX]
    end
    module_function :has_avx?

    def has_avx2?
      SDL_bool[SDL2.SDL_HasAVX2]
    end
    module_function :has_avx?

    def has_neon?
      SDL_bool[SDL2.SDL_HasNEON]
    end
    module_function :has_neon?

    def system_ram
      SDL2.SDL_GetSystemRAM.to_i
    end
    module_function :system_ram
    #
    # SDL_platform
    #
    def platform
      SDL2.SDL_GetPlatform.to_s
    end
    module_function :platform
  end
end