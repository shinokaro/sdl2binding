require 'forwardable'

module SDL2
  class MultiGestureEvent
    def self.struct_class
      SDL_MultiGestureEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :touch_id, :touchId
    def_delegator :event, :dTheta
    def_delegator :event, :dDist
    def_delegator :event, :x
    def_delegator :event, :y
    def_delegator :event, :numFingers
  end
  #
  #
  #
  module EventType
    module MultiGesture
      extend EventType

      def self.event_class
        MultiGestureEvent
      end

      def self.to_i
        SDL_MULTIGESTURE
      end
    end
  end
end