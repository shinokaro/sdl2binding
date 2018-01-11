module SDL2
  #
  # SDL_timer.h
  #
  require_relative 'SDL_stdinc'

  # typedef Uint32 (SDLCALL * SDL_TimerCallback) (Uint32 interval, void *param);
  typealias 'SDL_TimerCallback', 'void*'
  typealias 'SDL_TimerID', 'int'

  const_set :SDL_TICKS_PASSED, -> (a, b) { (b - a) <= 0 }

  extern 'Uint32 SDL_GetTicks(void)'
  extern 'Uint64 SDL_GetPerformanceCounter(void)'
  extern 'Uint64 SDL_GetPerformanceFrequency(void)'
  extern 'void SDL_Delay(Uint32 ms)'
  # extern 'SDL_TimerID SDL_AddTimer(Uint32 interval, SDL_TimerCallback callback, void *param)'
  extern 'SDL_bool SDL_RemoveTimer(SDL_TimerID id)'
end
