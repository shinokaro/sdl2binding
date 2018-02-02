require 'forwardable'

module SDL2
  class TextEditingEvent < EventEntity
    def self.struct_class
      SDL_TextEditingEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID
    def_delegator :event, :text # "char text[#{SDL_TEXTEDITINGEVENT_TEXT_SIZE}]",  # The editing text
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
