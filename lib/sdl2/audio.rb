require 'forwardable'
require_relative 'audio_spec'
require_relative 'audio_format'
require_relative 'pointer'
require_relative 'init_sub_system'

module SDL2
  class Audio
    extend InitSubSystem

    def self.init_num
      SDL_INIT_AUDIO
    end

    class << self
      def drivers
        AudioDriver.drivers
      end

      def input_devices
        AudioDevice.input_devices
      end

      def output_devices
        AudioDevice.output_devices
      end

      def load_wav_rw(src, free_src = 1)
        spec  = AudioSpec.new
        buf   = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP, Fiddle::RUBY_FREE)
        len   = IntPointer.new
        error = SDL2.SDL_LoadWAV_RW(src, free_src, spec, buf, len)
        raise Error if error == Fiddle::NULL
        str = buf.ptr.to_str(len.value)
        SDL2.SDL_free(buf.ptr)
        [spec, str]
      end

      def load_wav(file)
        load_wav_rw(SDL2.SDL_RWFromFile(file, 'rb'), 1)
      end
    end

    extend Forwardable

    def_delegators :@audio_spec, :freq, :format, :channels

    def initialize(is_capture = false, device: nil, freq: 48_000, format: 'S16', channels: 2, allowed_changes: 0)
      desired   = AudioSpec.new(freq: freq, format: format, channels: channels)
      obtained  = AudioSpec.new
      is_capture = if device.respond_to?(:capture)
                     device.capture
                   else
                     capture
                   end
      device_id = SDL2.SDL_OpenAudioDevice(device && device.to_s, is_capture ? 1 : 0, desired, obtained, allowed_changes)
      raise Error if device_id == 0

      @audio_spec = (obtained == Fiddle::NULL) ? desired : obtained
      @device_id  = device_id
      @capture    = !!is_capture
    end

    attr_reader :device_id, :capture

    alias to_i device_id

    def queued_audio_size
      SDL2.SDL_GetQueuedAudioSize(@device_id)
    end

    def queue_audio(data)
      error = SDL2.SDL_QueueAudio(@device_id, data, data.size)
      raise Error if error < 0
      self
    end

    alias << queue_audio

    def dequeue_audio(len)
      data = Fiddle::Pointer.malloc(len)
      size = SDL2.SDL_DequeueAudio(@device_id, data, len)
      data.to_s(size)
    end

    def clear_queued_audio
      SDL2.SDL_ClearQueuedAudio(@device_id)
    end

    def pause(pause_on = 1)
      SDL2.SDL_PauseAudioDevice(@device_id, pause_on)
    end

    def play
      pause(0)
    end

    def status
      SDL2.SDL_GetAudioDeviceStatus(@device_id)
    end

    def stopped?
      status == SDL_AUDIO_STOPPED
    end

    def playing?
      status == SDL_AUDIO_PLAYING
    end

    def paused?
      status == SDL_AUDIO_PAUSED
    end

    def input?
      @capture
    end

    def output?
      @capture
    end

    def close
      SDL2.SDL_CloseAudioDevice(@device_id)
    end
  end
end
