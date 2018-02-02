require 'forwardable'

module SDL2
  class CommonEvent
    def self.struct_class
      SDL_CommonEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
  end

  module EventType
    module App_Terminating
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_TERMINATING
      end
    end

    module App_LowMemory
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_LOWMEMORY
      end
    end

    module App_WillEnterBackGround
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_WILLENTERBACKGROUND
      end
    end

    module App_DidEnterBackGround
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_DIDENTERBACKGROUND
      end
    end

    module App_WillEnterForeGround
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_WILLENTERFOREGROUND
      end
    end

    module App_DidEnterForeGround
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_APP_DIDENTERFOREGROUND
      end
    end

    module KeyMapChanged
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_KEYMAPCHANGED
      end
    end

    module ClipBoardUpdate
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_CLIPBOARDUPDATE
      end
    end

    module Render_Targets_Reset
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_RENDER_TARGETS_RESET
      end
    end

    module Render_Device_Reset
      extend EventType

      def self.event_class
        CommonEvent
      end

      def self.to_i
        SDL_RENDER_DEVICE_RESET
      end
    end
  end
end
