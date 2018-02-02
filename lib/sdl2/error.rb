module SDL2
  class Error < StandardError
    class << self
      def clear_error
        SDL2.SDL_ClearError
      end

      def get_error
        SDL2.SDL_GetError.to_s
      end
    end

    def to_s
      self.class.get_error
    end

    private

    def clear
      self.class.clear_error
    end
  end
end
