require 'forwardable'

module SDL2
  class DropEvent < EventEntity
    def self.struct_class
      SDL_DropEvent
    end

    extend Forwardable

    def file?
      type.to_i == SDL_DROPFILE
    end

    def text?
      type.to_i == SDL_DROPTEXT
    end

    def begin?
      type.to_i == SDL_DROPBEGIN
    end

    def complete?
      type.to_i == SDL_DROPCOMPLETE
    end

    def_delegator :event, :timestamp
    def_delegator :event, :file

    def filename
      @filename ||= if Fiddle::NULL == file
                      nil
                    else
                      str = file.to_s
                      SDL2.SDL_free(file)
                      str
                    end
    end

    def_delegator :event, :windowID, :window_id
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
