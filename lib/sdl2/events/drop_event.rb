require 'forwardable'

module SDL2
  class DropEvent
    def self.struct_class
      DropEvent
    end
  end

  module EventType
    module DropFile
      extend EventType

      def self.event_class
        DropEvent
      end

      def self.to_i
        SDL_DROPFILE
      end
    end

    module DropText
      extend EventType

      def self.event_class
        DropEvent
      end

      def self.to_i
        SDL_DROPTEXT
      end
    end

    module DropBegin
      extend EventType

      def self.event_class
        DropEvent
      end

      def self.to_i
        SDL_DROPBEGIN
      end
    end

    module DropComplete
      extend EventType

      def self.event_class
        DropEvent
      end

      def self.to_i
        SDL_DROPCOMPLETE
      end
    end
  end
end
