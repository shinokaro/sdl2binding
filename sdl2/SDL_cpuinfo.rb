module SDL2
  module SDL_Cpuinfo
    #
    # SDL_cpuinfo.h
    #
    SDL_CACHELINE_SIZE = 128

    def included(m)
      m.module_eval {
        extern 'int SDL_GetCPUCount(void)'
        extern 'int SDL_GetCPUCacheLineSize(void)'
        extern 'SDL_bool SDL_HasRDTSC(void)'
        extern 'SDL_bool SDL_HasAltiVec(void)'
        extern 'SDL_bool SDL_HasMMX(void)'
        extern 'SDL_bool SDL_Has3DNow(void)'
        extern 'SDL_bool SDL_HasSSE(void)'
        extern 'SDL_bool SDL_HasSSE2(void)'
        extern 'SDL_bool SDL_HasSSE3(void)'
        extern 'SDL_bool SDL_HasSSE41(void);'
        extern 'SDL_bool SDL_HasSSE42(void)'
        extern 'SDL_bool SDL_HasAVX(void)'
        extern 'SDL_bool SDL_HasAVX2(void)'
        extern 'SDL_bool SDL_HasNEON(void)'
        extern 'int SDL_GetSystemRAM(void)'
      }
    end
    module_function :included
  end
end
