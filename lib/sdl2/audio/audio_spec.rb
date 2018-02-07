require 'forwardable'
require_relative 'audio_format'

module SDL2
  class Audio
    module AudioSpecDelegator
      extend Forwardable

      def_delegators :audio_spec,
                     :freq, :format, :channels,
                     :bit_size, :float?, :integer?,
                     :bigendian?, :littleendian?,
                     :signed?, :unsigned?
    end

    class AudioSpec
      def initialize(freq: nil, channels: nil, **format)
        @ptr = Fiddle::Pointer.malloc(SDL_AudioSpec.size, Fiddle::RUBY_FREE)
        @audio_spec = SDL_AudioSpec.new(@ptr)
        @audio_spec.freq     = freq
        @audio_spec.format   = AudioFormat.create(**format)
        @audio_spec.channels = channels
        @audio_spec.callback = nil
        @audio_spec.userdata = nil
      end

      extend Forwardable

      def_delegator :@ptr, :to_i
      attr_reader :audio_spec
      include AudioSpecDelegator

      include AudioFormat

      def to_hash
        {freq: freq, channels: channels, format: format,
         float: float?, bigendian: bigendian?, signed: signed?,
         bit_size: bit_size}
      end
    end
  end
end
