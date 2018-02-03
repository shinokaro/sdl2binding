require 'forwardable'
require_relative 'event_entity'
require_relative 'event_type'

module SDL2
  module Event
    class << self
      def pump
        # これは呼び出しルール、メインスレッドから、がある.。
        # Thread.current == Thread.main でチェックする。
        SDL2.SDL_PumpEvents
      end

      def event?(type = nil, max_type = nil)
        if type.nil? && max_type.nil?
          type, max_type = SDL_FIRSTEVENT, SDL_LASTEVENT
        end
        if max_type
          SDL_bool[SDL2.SDL_HasEvents(type, max_type)]
        else
          SDL_bool[SDL2.SDL_HasEvent(type)]
        end
      end

      def flush(type = nil, max_type = nil)
        if type.nil? && max_type.nil?
          type, max_type = SDL_FIRSTEVENT, SDL_LASTEVENT
        end
        if max_type
          SDL2.SDL_FlushEvents(type, max_type)
        else
          SDL2.SDL_FlushEvent(type)
        end
      end

      def cycle(num_events, type = nil, max_type = nil)
        peep(num_events, SDL_ADDEVENT, type = nil, max_type = nil)
      end

      def peek(num_events, type = nil, max_type = nil)
        peep(num_events, SDL_PEEKEVENT, type = nil, max_type = nil)
      end

      def gets(num_events, type = nil, max_type = nil)
        peep(num_events, SDL_GETEVENT, type = nil, max_type = nil)
      end

      def peep(num_events, action, type = nil, max_type = nil)
        if type.nil? && max_type.nil?
          type, max_type = SDL_FIRSTEVENT, SDL_LASTEVENT
        end
        size = SDL_Event.size
        events = Fiddle::Pointer.malloc(size * num_events)
        count = SDL2.SDL_PeepEvents(events, num_events, action, type, max_type ? max_type : type)
        raise Error if count < 0
        num_events.times.map do |i|
          events + size * i # attrbute を読み出してコピーする
        end
      end

      def empty?
        SDL2.SDL_PollEvent(Fiddle::NULL) == 0
      end

      def poll
        ptr = malloc
        event = SDL_Event.new(ptr)
        res = SDL2.SDL_PollEvent(event)
        create(ptr) if res != 0
      end

      def wait
        ptr = malloc
        event = SDL_Event.new(ptr)
        res = SDL2.SDL_WaitEvent(event)
        raise Error if res == 0
        create(ptr)
      end

      def wail_with_timeout(timeout)
        ptr = malloc
        event = SDL_Event.new(ptr)
        res = SDL2.SDL_WaitEventTimeout(event, timeout)
        raise Error if res == 0
        create(ptr)
      end

      def push(event)
        res = SDL2.SDL_PushEvent(event)
        raise Error if res != 1
      end

      def malloc
        Fiddle::Pointer.malloc(SDL_Event.size, Fiddle::RUBY_FREE)
      end

      def create(ptr)
        EventTypeMap.instance.create_event(ptr)
      end
    end
  end
end
