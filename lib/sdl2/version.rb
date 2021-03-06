require 'forwardable'

module SDL2
  class Version
    class << self
      def version
        ver = new
        SDL2.SDL_GetVersion(ver)
        ver
      end

      def revision
        SDL2.SDL_GetRevision.to_s
      end

      def revision_number
        SDL2.SDL_GetRevisionNumber.to_i
      end
    end

    extend Forwardable

    def_delegators :@version, :major, :minor, :patch, :to_i

    def initialize
      @ptr = Fiddle::Pointer.malloc(SDL_version.size, Fiddle::RUBY_FREE)
      @version = SDL_version.new(@ptr)
    end

    def to_s
      [major, minor, patch].join('.')
    end
  end
end
