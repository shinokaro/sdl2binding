require 'forwardable'

module SDL2
  class JoyHatEvent
    def self.struct_class
      SDL_JoyHatEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which # 'SDL_JoystickID which', # The joystick instance id
    def_delegator :event, :hat
    def_delegator :event, :value
  end
  #
  #
  #
  module EventType
    module JoyHatMotion
      extend EventType

      def self.event_class
        JoyHatEvent
      end

      def self.to_i
        SDL_JOYHATMOTION
      end
    end
  end
end
