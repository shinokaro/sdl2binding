require 'forwardable'

module SDL2
  class DollarGestureEvent < EventEntity
    def self.struct_class
      SDL_DollarGestureEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :touch_id,    :touchId
    def_delegator :event, :gesture_id,  :gestureId
    def_delegator :event, :num_fingers, :numFingers
    def_delegator :event, :error
    def_delegator :event, :x
    def_delegator :event, :y
  end

  module EventType
    module DollarGesture
      extend EventType

      def self.event_class
        DollarGestureEvent
      end

      def self.to_i
        SDL_DOLLARGESTURE
      end
    end

    module DollarRecord
      extend EventType

      def self.event_class
        DollarGestureEvent
      end

      def self.to_i
        SDL_DOLLARRECORD
      end
    end
  end
end
