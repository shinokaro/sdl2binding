module SDL2
  SDL_EventFilter = bind('int *SDL_EventFilter(void* userdata, SDL_Event* event)') { |userdata, event|
    yield(SDL_Event.new(event), userdata) ? 1 : 0
  }

  module EventFilter
    def self.create_event_filter(&block)
      # typedef int (* SDL_EventFilter) (void *userdata, SDL_Event * event)
    end

    def self.set_event_filter(filter, userdata)
      SDL2.SDL_SetEventFilter(filter, userdata)
    end

    def self.get_event_filter(filter, userdata)
      # ポインター受け取りのパターン
      # SDL_bool[SDL2.SDL_GetEventFilter(SDL_EventFilter * filter, void **userdata)]
      # empty?
    end

    def self.filter_events(filter, userdata)
      SDL2.SDL_FilterEvents(filter, userdata)
    end
  end

  class EventWatch
    def self.add_event_watch(filter, userdata)
      SDL2.SDL_AddEventWatch(filter, userdata)
    end

    def self.del_event_watch(filter, userdata)
      SDL2.SDL_DelEventWatch(filter, userdata)
    end

    def initialize(*userdata, proc = nil, &block)
      proc { |userdata_ptr, event_ptr|
        event = event_ptr.force_event_class
        block.call(event, *userdata_ptr.value)
      }
      @filter   = filter
      @userdata = userdata # pointer
      @_userdata = userdata
    end

    def enable
      self.class.add_event_watch(@filter, @userdata)
      # set_GC
    end

    def destroy
      self.class.del_event_watch(@filter, @userdata)
    end
  end
end
