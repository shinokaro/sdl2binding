module SDL2
  class AudioDevice
    class << self
      def num(is_capture = false)
        num = SDL2.SDL_GetNumAudioDevices(is_capture ? 1 : 0)
        num == -1 ? 0 : num
      end

      def num_inputs
        num(true)
      end

      def num_outputs
        num(false)
      end

      def devices(is_capture = false)
        num(is_capture).times.map { |i| new(i, is_capture) }
      end

      def input_devices
        devices(true)
      end

      def output_devices
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
      char = SDL2.SDL_GetAudioDeviceName(@index, @capture ? 1 : 0)
      (char == Fiddle::NULL) ? nil : char.to_s.force_encoding('UTF-8')
    end

    alias to_s name

    def input?
      @capture
    end

    def output?
      !@capture
    end

    def open(freq:, format:, channels:, allowed_changes: 0)
      Audio.new(@capture, device: self,
                freq:freq, format: format, channels: channels,
                allowed_changes: allowed_changes)
    end
  end
end
