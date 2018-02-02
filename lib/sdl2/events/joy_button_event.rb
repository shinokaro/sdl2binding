require 'forwardable'

module SDL2
  class JoyButtonEvent
    def self.struct_class
      SDL_JoyButtonEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which # 'SDL_JoystickID which', # The joystick instance id
    def_delegator :event, :button
    def_delegator :event, :state
  end
  #
  #
  #
  module EventType
    module JoyButtonDown
      extend EventType

      def self.event_class
        JoyButtonEvent
      end

      def self.to_i
        SDL_JOYBUTTONDOWN
      end
    end

    module JoyButtonUp
      extend EventType

      def self.event_class
        JoyButtonEvent
      end

      def self.to_i
        SDL_JOYBUTTONUP
      end
    end
  end
end