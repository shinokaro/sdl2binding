require 'forwardable'
require_relative 'audio_spec'
require_relative 'audio_format'

module SDL2
  class Audio
    class AudioWave
      def self.load(file)
        src = SDL2.SDL_RWFromFile(file, 'rb')
        free_src = 1
        spec  = AudioSpec.new
        buf   = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP, Fiddle::RUBY_FREE)
        len   = IntPointer.new
        error = SDL2.SDL_LoadWAV_RW(src, free_src, spec, buf, len)
        raise Error if error == Fiddle::NULL
        str = buf.ptr.to_str(len.value)
        SDL2.SDL_free(buf.ptr)

        new(spec, str)
      end

      def initialize(spec, data)
        @audio_spec = spec
        @data = data
      end

      attr_reader :data
      alias to_s data

      attr_reader :audio_spec
      include AudioSpecDelegator
      include AudioFormat

      extend Forwardable
      def_delegator :audio_spec, :to_hash
    end
  end
end
