require 'forwardable'

module SDL2
  class MouseWheelEvent
    def self.struct_class
      SDL_MouseWheelEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID
    def_delegator :event, :which
    def_delegator :event, :x
    def_delegator :event, :y
    def_delegator :event, :direction
  end

  module EventType
    module MouseWheel
      extend EventType

      def self.event_class
        MouseWheelEvent
      end

      def self.to_i
        SDL_MOUSEWHEEL
      end
    end
  end
end
