require 'forwardable'

module SDL2
  class JoyAxisEvent
    def self.struct_class
      SDL_JoyAxisEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which # 'SDL_JoystickID which', # The joystick instance id
    def_delegator :event, :axis
    def_delegator :event, :value
  end
  #
  #
  #
  module EventType
    module JoyAxisMotion
      extend EventType

      def self.event_class
        JoyAxisEvent
      end

      def self.to_i
        SDL_JOYAXISMOTION
      end
    end
  end
end