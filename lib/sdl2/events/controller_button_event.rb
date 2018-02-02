require 'forwardable'

module SDL2
  class ControllerButtonEvent
    def self.struct_class
      SDL_ControllerButtonEvent
    end
  end

  module EventType
    module ControllerButtonDown
      extend EventType

      def self.event_class
        ControllerButtonEvent
      end

      def self.to_i
        SDL_CONTROLLERBUTTONDOWN
      end
    end

    module ControllerButtonUp
      extend EventType

      def self.event_class
        ControllerButtonEvent
      end

      def self.to_i
        SDL_CONTROLLERBUTTONUP
      end
    end
  end
end
