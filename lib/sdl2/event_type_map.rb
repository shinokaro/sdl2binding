require 'singleton'

module SDL2
  #
  # EventTypeMap クラス
  # このオブジェクトはType番号に対応するEventTypeモジュールを知っている。
  # シングルトンクラスにすることでモジュールの読み込み順序を解決している。
  # マッピング更新の際にレーシングを避ける方法を実装すること。
  # UserEvent 追加の時だけなので Queue を検討する。
  #
  class EventTypeMap
    include Singleton

    def initialize
      @map = EventType.constants.map { |name| m = EventType.const_get(name); [m.to_i, m] }.to_h
      @map.default_proc = proc { |_, type_num| raise Error, "Undefined event type(#{type_num})" }
    end

    def [](type)
      @map[type.to_i]
    end

    def create_event(ptr, type:)
      self[type].event_class.new(ptr, type: type)
    end

    def create_user_event(*event_class)
      type_num = add_user_events
      @map[type_num] = EventType::UserEvent.new(type_num, *event_class)
    end

    def add_user_events(num_events = 1)
      first_num = SDL2.SDL_RegisterEvents(num_events)
      raise Error, 'can not defined' if first_num == 0xFFFFFFFF # ((Uint32) - 1)
      first_num
    end
  end
end
