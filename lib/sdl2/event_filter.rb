require 'singleton'

module SDL2
  class EventFilter
    class Callback < Fiddle::Closure
      def initialize(&block)
        super(Fiddle::TYPE_INT, [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP])
        @proc = block
      end

      def call(_, event)
        @proc.call(Event.create(event)) ? 1 : 0
      end
    end

    include Singleton

    def initialize
      @filter  = nil
      @monitor = nil
      @watcher = []
    end

    def filter=(filter)
      SDL2.SDL_SetEventFilter(filter, nil)
      @filter = filter
    end

    attr_reader :filter

    # def filter?
    #   SDL2.SDL_bool[SDL2.SDL_GetEventFilter(nil, nil)]
    # end

    def monitor=(filter)
      SDL2.SDL_FilterEvents(filter, nil)
      @monitor = filter
    end

    attr_reader :monitor

    def add_watcher(filter)
      if @watcher.include?(filter)
        false
      else
        SDL2.SDL_AddEventWatch(filter, nil)
        @watcher << filter
        true
      end
    end

    def remove_watcher(filter)
      if @watcher.include?(filter)
        SDL2.SDL_DelEventWatch(@watcher, nil)
        @watcher.delete(filter)
        true
      else
        false
      end
    end
  end
end
