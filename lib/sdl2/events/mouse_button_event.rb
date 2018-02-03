require 'forwardable'

module SDL2
  class MouseButtonEvent < EventEntity
    def self.struct_class
      SDL_MouseButtonEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :windowID, :window_id
    def_delegator :event, :which
    def_delegator :event, :button
    def_delegator :event, :state
    def_delegator :event, :clicks
    def_delegator :event, :x
    def_delegator :event, :y
  end
  #
  #
  #
  module EventType
    module MouseButtonDown
      extend EventType

      def self.event_class
        MouseButtonEvent
      end

      def self.to_i
        SDL_MOUSEBUTTONDOWN
      end
    end

    module MouseButtonUp
      extend EventType

      def self.event_class
        MouseButtonEvent
      end

      def self.to_i
        SDL_MOUSEBUTTONUP
      end
    end
  end
end
