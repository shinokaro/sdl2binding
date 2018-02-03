require 'forwardable'

module SDL2
  class AudioDeviceEvent < EventEntity
    def self.struct_class
      SDL_AudioDeviceEvent
    end

    extend Forwardable

    def added?
      type.to_i == SDL_AUDIODEVICEADDED
    end

    def removed?
      type.to_i == SDL_AUDIODEVICEREMOVED
    end

    def_delegator :event, :timestamp
    def_delegator :event, :which
    alias audio_device_id which
    def_delegator :event, :iscapture

    def capture
      iscapture != 0
    end

    def input?
      capture
    end

    def output?
      !capture
    end
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
