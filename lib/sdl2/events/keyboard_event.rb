require 'forwardable'
require_relative '../scancode'
require_relative '../keycode'
require_relative '../keymod'

module SDL2
  class KeyboardEvent < EventEntity
    def self.struct_class
      SDL_KeyboardEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID

    def pressed?
      event.staet == SDL_PRESSED
    end

    def released?
      event.state == SDL_RELEASED
    end

    def repeat?
      event.repeat != 0
    end

    def scancode
      Scancode.new(event.scancode)
    end

    def keycode
      Keycode.new(event.sym)
    end

    def keymod
      Keymod.new(event.mod)
    end
  end
  #
  #
  #
  module EventType
    module KeyDown
      extend EventType

      def self.event_class
        KeyboardEvent
      end

      def self.to_i
        SDL_KEYDOWN
      end
    end

    module KeyUp
      extend EventType

      def self.event_class
        KeyboardEvent
      end

      def self.to_i
        SDL_KEYUP
      end
    end
  end
end
