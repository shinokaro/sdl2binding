module SDL2
  module Helper
    def clear_error
      SDL2.SDL_ClearError
    end

    module_function :clear_error

    def error_msg
      SDL2.SDL_GetError.to_s
    end

    module_function :error_msg
  end
end
