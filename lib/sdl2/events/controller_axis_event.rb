require 'forwardable'

module SDL2
  class ControllerAxisEvent
    def self.struct_class
      SDL_ControllerAxisEvent
    end
  end
  #
  #
  #
  module EventType
    module ControllerAxisMotion
      extend EventType

      def self.event_class
        ControllerAxisEvent
      end

      def self.to_i
        SDL_CONTROLLERAXISMOTION
      end
    end
  end
end
