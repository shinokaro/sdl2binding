require 'forwardable'

module SDL2
  class TextEditingEvent < EventEntity
    def self.struct_class
      SDL_TextEditingEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :windowID, :window_id

    def text
      event.text.pack('C*').split("\0", 2).first.force_encoding('UTF-8')
    end

    def_delegator :event, :start
    def_delegator :event, :length
  end
  #
  #
  #
  module EventType
    module TextEditing
      extend EventType

      def self.event_class
        TextEditingEvent
      end

      def self.to_i
        SDL_TEXTEDITING
      end
    end
  end
end
