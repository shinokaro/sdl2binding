require 'forwardable'

module SDL2
  class WindowEvent < EventEntity
    def self.struct_class
      SDL_WindowEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :windowID, :window_id
    def_delegator :event, :event, :window_event_id
    def_delegator :event, :data1
    def_delegator :event, :data2
  end

  module EventType
    module WindowEvent
      extend EventType

      def self.event_class
        SDL2::WindowEvent
      end

      def self.to_i
        SDL_WINDOWEVENT
      end
    end
  end
end
