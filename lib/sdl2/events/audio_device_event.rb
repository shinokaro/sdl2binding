require 'forwardable'

module SDL2
  class AudioDeviceEvent < EventEntity
    def self.struct_class
      SDL_AudioDeviceEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :which
    def_delegator :event, :iscapture
  end

  module EventType
    module AudioDeviceAdded
      extend EventType

      def self.event_class
        AudioDeviceEvent
      end

      def self.to_i
        SDL_AUDIODEVICEADDED
      end
    end

    module AudioDeviceRemoved
      extend EventType

      def self.event_class
        AudioDeviceEvent
      end

      def self.to_i
        SDL_AUDIODEVICEREMOVED
      end
    end
  end
end
