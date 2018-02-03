require 'forwardable'

module SDL2
  class TextInputEvent < EventEntity
    def self.struct_class
      SDL_TextInputEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :windowID, :window_id

    def text
      event.text.pack('C*').split("\0", 2).first.force_encoding('UTF-8')
    end
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
