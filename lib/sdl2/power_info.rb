require_relative 'pointer'

module SDL2
  class PowerInfo
    include Pointer

    def initialize
      secs = IntPointer.new
      pct  = IntPointer.new
      state = SDL2.SDL_GetPowerInfo(secs, pct)
      prefix = 'SDL_POWERSTATE_'
      @state_name = SDL2.constants.grep(/^#{prefix}/).find { |name| SDL2.const_get(name, false) == state }.to_s.delete_prefix(prefix)
      @remaining_time = (secs.value == -1) ? Float::INFINITY : secs.value
      @percent = pct.value
    end

    attr_reader :state_name, :remaining_time, :percent
  end
end
