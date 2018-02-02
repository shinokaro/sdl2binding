require 'forwardable'

module SDL2
  class SysWMEvent
    def self.struct_class
      SDL_SysWMEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :msg #'SDL_SysWMmsg *msg' # driver dependent data, defined in SDL_syswm.h
  end

  module EventType
    module SysWMEvent
      extend EventType

      def self.event_class
        SDL2::SysWMEvent
      end

      def self.to_i
        SDL_SYSWMEVENT
      end
    end
  end
end