require 'forwardable'

module SDL2
  class AudioDevice

    class << self
      #
      # Driver
      #
      def current_audio_driver
        char_ptr = SDL2.SDL_GetCurrentAudioDriver
        (char_ptr.to_i == 0) ? nil : char_ptr.to_s
      end

      def num_audio_drivers
        SDL2.SDL_GetNumAudioDrivers
      end

      def audio_driver(index)
        char_ptr = SDL2.SDL_GetAudioDriver(index)
        (char_ptr.to_i == 0) ? nil : char_ptr.to_s
      end

      def audio_drivers
        num_audio_drivers.times.map { |i| audio_driver(i) }
      end
      #
      # Device
      #
      def num_audio_devices(iscapture = 0)
        num = SDL2.SDL_GetNumAudioDevices(iscapture)
        num == -1 ? nil : num
      end

      def audio_device_name(index, iscapture = 0)
        char_ptr = SDL2.SDL_GetAudioDeviceName(index, iscapture)
        (char_ptr.to_i == 0) ? nil : char_ptr.to_s.force_encoding('UTF-8')
      end

      def audio_device_names(iscapture = 0)
        num_audio_devices(iscapture).times.map { |i| audio_device_name(i, iscapture) }
      end
    end

    extend Forwardable

    def_delegators :@audio_spec, :freq, :channels

    attr_reader :audio_device_id

    def initialize(iscapture = 0, device: nil, freq:, format:, channels:)
      desired = SDL2::SDL_AudioSpec.malloc
      desired.freq     = freq
      desired.format   = format
      desired.channels = channels
      desired.callback = nil
      desired.userdata = nil

      allowed_changes = 0
      obtained = SDL2::SDL_AudioSpec.malloc
      audio_device_id = SDL2.SDL_OpenAudioDevice(device, iscapture, desired, obtained, allowed_changes)
      raise "#{SDL2.SDL_GetError}" if audio_device_id == 0

      ObjectSpace.define_finalizer(self, eval("proc { SDL2.SDL_CloseAudioDevice(#{audio_device_id}) }", TOPLEVEL_BINDING))

      @audio_spec = obtained.to_i == 0 ? desired : obtained
      @audio_device_id = audio_device_id
      @iscapture = iscapture
    end

    def queued_audio_size
      SDL2.SDL_GetQueuedAudioSize(@audio_device_id)
    end

    def queue_audio(data)
      error = SDL2.SDL_QueueAudio(@audio_device_id, data, data.size)
      raise "#{SDL2.SDL_GetError}" if error < 0
      self
    end

    alias << queue_audio

    def dequeue_audio(len)
      data = Fiddle::Pointer.malloc(len)
      size = SDL2.SDL_DequeueAudio(@audio_device_id, data, len)
      data.to_s(size)
    end

    def clear_queued_audio
      SDL2.SDL_ClearQueuedAudio(@audio_device_id)
    end

    def pause(pause_on = 1)
      SDL2.SDL_PauseAudioDevice(@audio_device_id, pause_on)
    end

    def play
      pause(0)
    end

    def status
      SDL2.SDL_GetAudioDeviceStatus(@audio_device_id)
    end

    def stopped?
      status == SDL2::SDL_AUDIO_STOPPED
    end

    def playing?
      status == SDL2::SDL_AUDIO_PLAYING
    end

    def paused?
      status == SDL2::SDL_AUDIO_PAUSED
    end

    def input?
      iscapture != 0
    end

    def output?
      iscapture == 0
    end
  end
end
