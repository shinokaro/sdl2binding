require 'forwardable'
require_relative 'pointer'
require_relative 'init_sub_system'
require_relative 'audio/audio_spec'
require_relative 'audio/audio_format'
require_relative 'audio/capture_status'
require_relative 'audio/audio_wave'

module SDL2
  class Audio
    extend InitSubSystem

    def self.init_num
      SDL_INIT_AUDIO
    end

    extend SingleForwardable

    def_delegator AudioDriver, :drivers
    def_delegator AudioDevice, :inputs,  :input_devices
    def_delegator AudioDevice, :outputs, :output_devices
    def_delegator AudioWave,   :load

    extend Forwardable

    def initialize(capture: false, device: nil, allowed_changes: 0, **spec)
      desired   = AudioSpec.new(**spec)
      obtained  = AudioSpec.new
      capture   = device.respond_to?(:capture) ? device.capture : capture
      device_id = SDL2.SDL_OpenAudioDevice(device && device.to_s,
                                           capture ? 1 : 0,
                                           desired, obtained,
                                           allowed_changes)
      raise Error if device_id == 0

      @audio_spec = (obtained == Fiddle::NULL) ? desired : obtained
      @device_id  = device_id
      @capture    = capture
    end

    attr_reader :audio_spec
    include AudioSpecDelegator

    attr_reader :device_id, :capture

    alias to_i device_id

    def queued_size
      SDL2.SDL_GetQueuedAudioSize(device_id)
    end

    def queue(data)
      error = SDL2.SDL_QueueAudio(device_id, data, data.size)
      raise Error if error < 0
      self
    end

    alias << queue

    def dequeue(len)
      data = Fiddle::Pointer.malloc(len)
      size = SDL2.SDL_DequeueAudio(device_id, data, len)
      data.to_s(size)
    end

    def clear_queued
      SDL2.SDL_ClearQueuedAudio(device_id)
    end

    def pause(pause_on = 1)
      SDL2.SDL_PauseAudioDevice(device_id, pause_on)
    end

    def play
      pause(0)
    end

    def status
      SDL2.SDL_GetAudioDeviceStatus(device_id)
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

    include CaptureStatus

    def close
      SDL2.SDL_CloseAudioDevice(device_id)
      @device_id = nil
    end
  end
end
