require 'forwardable'

module SDL2
  class ControllerDeviceEvent
    def self.struct_class
      SDL_ControllerDeviceEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which
  end

  module EventType
    module ControllerDeviceAdded
      extend EventType

      def self.event_class
        ControllerDeviceEvent
      end

      def self.to_i
        SDL_CONTROLLERDEVICEADDED
      end
    end

    module ControllerDeviceRemoved
      extend EventType

      def self.event_class
        ControllerDeviceEvent
      end

      def self.to_i
        SDL_CONTROLLERDEVICEREMOVED
      end
    end

    module ControllerDeviceRemapped
      extend EventType

      def self.event_class
        ControllerDeviceEvent
      end

      def self.to_i
        SDL_CONTROLLERDEVICEREMAPPED
      end
    end
  end
end
