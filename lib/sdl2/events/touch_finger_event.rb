require 'forwardable'

module SDL2
  class TouchFingerEvent < EventEntity
    def self.struct_class
      SDL_TouchFingerEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :touch_id,  :touchId
    def_delegator :event, :finger_id, :fingerId
    def_delegator :event, :x
    def_delegator :event, :y
    def_delegator :event, :dx
    def_delegator :event, :dy
    def_delegator :event, :pressure
  end

  module EventType
    module FingerDown
      extend EventType

      def self.event_class
        TouchFingerEvent
      end

      def self.to_i
        SDL_FINGERDOWN
      end
    end

    module FingerUp
      extend EventType

      def self.event_class
        TouchFingerEvent
      end

      def self.to_i
        SDL_FINGERUP
      end
    end

    module FingerMotion
      extend EventType

      def self.event_class
        TouchFingerEvent
      end

      def self.to_i
        SDL_FINGERMOTION
      end
    end
  end
end
