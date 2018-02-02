module SDL2
  class UndefinedEvent
    def self.struct_class
      SDL_Event
    end
  end

  module EventType
    module Undefined
      extend EventType

      def self.event_class
        UndefinedEvent
      end

      def self.to_i
        0xFFFFFFFF # ((Uint32) - 1)
      end
    end

    module FirstEvent
      extend EventType

      def self.event_class
        UndefinedEvent
      end

      def self.to_i
        SDL_FIRSTEVENT
      end
    end

    module LastEvent
      extend EventType

      def self.event_class
        UndefinedEvent
      end

      def self.to_i
        SDL_LASTEVENT
      end
    end
  end
end
