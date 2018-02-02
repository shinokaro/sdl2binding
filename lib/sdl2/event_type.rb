require_relative 'events/audio_device_event'
require_relative 'events/common_event'
require_relative 'events/controller_axis_event'
require_relative 'events/controller_button_event'
require_relative 'events/controller_device_event'
require_relative 'events/dollar_gesture_event'
require_relative 'events/drop_event'
require_relative 'events/joy_axis_event'
require_relative 'events/joy_ball_event'
require_relative 'events/joy_button_event'
require_relative 'events/joy_device_event'
require_relative 'events/joy_hat_event'
require_relative 'events/keyboard_event'
require_relative 'events/mouse_button_event'
require_relative 'events/mouse_motion_event'
require_relative 'events/mouse_wheel_event'
require_relative 'events/multi_gesture_event'
require_relative 'events/quit_event'
require_relative 'events/sys_w_m_event'
require_relative 'events/text_editing_event'
require_relative 'events/text_input_event'
require_relative 'events/touch_finger_event'
require_relative 'events/window_event'
require_relative 'events/undefined_event'
require_relative 'events/user_event'

require_relative 'event_type_map'

module SDL2
  module EventType
    def state
      SDL2.SDL_EventState(to_i, SDL_QUERY)
    end

    def disable
      old = SDL2.SDL_EventState(to_i, SDL_DISABLE)
      old == SDL_DISABLE
    end

    def disable?
      state == SDL_DISABLE
    end

    def enable
      old = SDL2.SDL_EventStatestate(to_i, SDL_ENABLE)
      old == SDL_ENABLE
    end

    def enable?
      state == SDL_ENABLE
    end

    def ===(event)
      self.to_i === event.type.to_i
    end

    def to_event(**attrs)
      attrs[:type] = self
      event_class.new(**attrs)
    end
  end
end
