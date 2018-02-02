module SDL2
  class EventEntity
    extend Forwardable

    def initialize(ptr = nil, type:, **attrs)
      @ptr   = ptr || Event.malloc
      @event = self.class.struct_class.new(@ptr)
      @type  = EventTypeMap.instance[type]
      raise "event type miss match" if @type.event_class != self.class
    end

    attr_reader   :ptr
    def_delegator :ptr, :to_i
    attr_reader   :event
    attr_reader   :type
  end
end
