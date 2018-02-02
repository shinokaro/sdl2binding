require 'forwardable'

module SDL2
  class MouseMotionEvent < EventEntity
    def self.struct_class
      SDL_MouseMotionEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID
    def_delegator :event, :which
    def_delegator :event, :state # see also SDL_GetMouseState().
    def_delegator :event, :x
    def_delegator :event, :y
    def_delegator :event, :xrel, :x_rel
    def_delegator :event, :yrel, :y_rel
  end
  #
  #
  # 
  module EventType
    module MouseMotion
      extend EventType

      def self.event_class
        MouseMotionEvent
      end

      def self.to_i
        SDL_MOUSEMOTION
      end
    end
  end
end
