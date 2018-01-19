require 'forwardable'
require_relative 'pixel_format'

module SDL2
  class DisplayMode
    extend Forwardable

    def_delegators :@display_mode, :w, :h, :refresh_rate, :to_i

    def initialize(w: 0, h: 0, refresh_rate: 0, format: 0)
      display_mode = SDL2::SDL_DisplayMode.malloc
      display_mode.format       = PixelFormat.new(format)
      display_mode.w            = w
      display_mode.h            = h
      display_mode.refresh_rate = refresh_rate
      display_mode.driverdata   = nil
      @display_mode = display_mode
    end

    def format
      SDL2::PixelFormat.new(@display_mode.format)
    end
  end
end
