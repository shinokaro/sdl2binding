require 'forwardable'

module SDL2
  class UserEvent
    def self.struct_class
      SDL_UserEvent
    end

    extend Forwardable

    def_delegator :event, :timestamp
    def_delegator :event, :window_id, :windowID
    def_delegator :event, :code   # User defined event code
    def_delegator :event, :data1  # User defined data pointer
    def_delegator :event, :data2  # User defined data pointer
    #
    # instance#new #=> clone & initialize with extend
    # と実装すればユーザイベントごとにカスタムが可能になる。
    # UserEventインスタンスを利用しないとcase判定で区別できない。
  end
  #
  #
  #
  module EventType
    class UserEvent
      def self.to_i
        SDL_USEREVENT - 1 # dummy for EventTypeMap
      end

      include EventType

      def initialize(type_num, event_class = SDL2::UserEvent)
        @to_i = type_num
        @event_class = event_class
      end

      attr_reader :event_class, :to_i
    end
  end
end
