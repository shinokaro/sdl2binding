require 'forwardable'

module SDL2
  class TextInputEvent < EventEntity
    def self.struct_class
      SDL_TextInputEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID
    def_delegator :event, :text # "char text[#{SDL_TEXTINPUTEVENT_TEXT_SIZE}]"  # The input text
  end
  #
  #
  #
  module EventType
    module TextInput
      extend EventType

      def self.event_class
        TextInputEvent
      end

      def self.to_i
        SDL_TEXTINPUT
      end
    end
  end
end
