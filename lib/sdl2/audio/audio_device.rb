require_relative 'capture_status'

module SDL2
  class Audio
    class AudioDevice
      class << self
        def count(is_capture = false)
          num = SDL2.SDL_GetNumAudioDevices(is_capture ? 1 : 0)
          num == -1 ? 0 : num
        end

        def inputs_count
          count(true)
        end

        def outputs_count
          count(false)
        end

        def devices(is_capture = false)
          count(is_capture).times.map { |i| new(i, is_capture) }
        end

        def inputs
          devices(true)
        end

        def outputs
          devices(false)
        end
      end

      def initialize(index, is_capture)
        @index   = index
        @capture = !!is_capture
      end

      attr_reader :index, :capture

      alias to_i index

      def name
        char = SDL2.SDL_GetAudioDeviceName(index, capture ? 1 : 0)
        (Fiddle::NULL == char) ? nil : char.to_s.force_encoding('UTF-8')
      end

      alias to_s name

      include CaptureStatus

      def open(allowed_changes: 0, **spec)
        Audio.new(capture: capture, device: self,
                  allowed_changes: allowed_changes, **spec)
      end
    end
  end
end
