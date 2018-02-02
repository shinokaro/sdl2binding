require 'forwardable'

module SDL2
  class JoyDeviceEvent
    def self.struct_class
      SDL_JoyDeviceEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which # 'Sint32 which' The joystick device index for the ADDED event, instance id for the REMOVED event
  end
  #
  #
  #
  module EventType
    module JoyDeviceAdded
      extend EventType

      def self.event_class
        JoyDeviceEvent
      end

      def self.to_i
        SDL_JOYDEVICEADDED
      end
    end

    module JoyDeviceRemoved
      extend EventType

      def self.event_class
        JoyDeviceEvent
      end

      def self.to_i
        SDL_JOYDEVICEREMOVED
      end
    end
  end
end