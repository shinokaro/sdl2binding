module SDL2
  module Info
    #
    # SDL_cpuinfo
    #
    def cpu_count
      SDL2.SDL_GetCPUCount.to_i
    end

    def cpu_cache_line_size
      SDL2.SDL_GetCPUCacheLineSize.to_i
    end

    def has_rdtsc?
      SDL_bool[SDL2.SDL_HasRDTSC]
    end

    def has_alti_vec?
      SDL_bool[SDL2.SDL_HasAltiVec]
    end

    def has_mmx?
      SDL_bool[SDL2.SDL_HasMMX]
    end

    def has_3d_now?
      SDL_bool[SDL2.SDL_Has3DNow]
    end

    def has_sse?
      SDL_bool[SDL2.SDL_HasSSE]
    end

    def has_sse2?
      SDL_bool[SDL2.SDL_HasSSE2]
    end

    def has_sse3?
      SDL_bool[SDL2.SDL_HasSSE3]
    end

    def has_sse41?
      SDL_bool[SDL2.SDL_HasSSE41]
    end

    def has_sse42?
      SDL_bool[SDL2.SDL_HasSSE42]
    end

    def has_avx?
      SDL_bool[SDL2.SDL_HasAVX]
    end

    def has_avx2?
      SDL_bool[SDL2.SDL_HasAVX2]
    end

    def has_neon?
      SDL_bool[SDL2.SDL_HasNEON]
    end

    def system_ram
      SDL2.SDL_GetSystemRAM.to_i
    end
    #
    # SDL_platform
    #
    def platform
      SDL2.SDL_GetPlatform.to_s
    end
  end
end
