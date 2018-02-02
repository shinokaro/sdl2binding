require 'forwardable'

module SDL2
  class JoyBallEvent
    def self.struct_class
      SDL_JoyBallEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which # 'SDL_JoystickID which' # The joystick instance id
    def_delegator :event, :ball
    def_delegator :event, :xrel
    def_delegator :event, :yrel
  end
  #
  #
  #
  module EventType
    module JoyBallMotion
      extend EventType

      def self.event_class
        JoyBallEvent
      end

      def self.to_i
        SDL_JOYBALLMOTION
      end
    end
  end
end
