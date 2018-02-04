require 'forwardable'

module SDL2
  class QuitEvent < EventEntity
    def self.struct_class
      SDL_QuitEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
  end

  module EventType
    module Quit
      extend EventType

      def self.event_class
        QuitEvent
      end

      def self.to_i
        SDL_QUIT
      end
    end
  end
end
