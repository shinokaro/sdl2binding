module SDL2
  class Window
    module Flags
      def self.create(fullscreen:    false, opengl:        false,
                      shown:         false, hidden:        false,
                      borderless:    false, resizable:     false,
                      minimized:     false, maximized:     false,
                      input_grabbed: false, input_focus:   false,
                      mouse_focus:   false, fullscreen_desktop: false,
                      foreign:       false, allow_highdpi: false,
                      mouse_capture: false, always_on_top: false,
                      skip_taskbar:  false, utility:       false,
                      tooltip:       false, popup_menu:    false,
                      vulkan:        false)
        [
            fullscreen         && SDL_WINDOW_FULLSCREEN,
            opengl             && SDL_WINDOW_OPENGL,
            shown              && SDL_WINDOW_SHOWN,
            hidden             && SDL_WINDOW_HIDDEN,
            borderless         && SDL_WINDOW_BORDERLESS,
            resizable          && SDL_WINDOW_RESIZABLE,
            minimized          && SDL_WINDOW_MINIMIZED,
            maximized          && SDL_WINDOW_MAXIMIZED,
            input_grabbed      && SDL_WINDOW_INPUT_GRABBED,
            input_focus        && SDL_WINDOW_INPUT_FOCUS,
            mouse_focus        && SDL_WINDOW_MOUSE_FOCUS,
            fullscreen_desktop && SDL_WINDOW_FULLSCREEN_DESKTOP,
            foreign            && SDL_WINDOW_FOREIGN,
            allow_highdpi      && SDL_WINDOW_ALLOW_HIGHDPI,
            mouse_capture      && SDL_WINDOW_MOUSE_CAPTURE,
            always_on_top      && SDL_WINDOW_ALWAYS_ON_TOP,
            skip_taskbar       && SDL_WINDOW_SKIP_TASKBAR,
            utility            && SDL_WINDOW_UTILITY,
            tooltip            && SDL_WINDOW_TOOLTIP,
            popup_menu         && SDL_WINDOW_POPUP_MENU,
            vulkan             && SDL_WINDOW_VULKAN
        ].select(&:itself).inject(0, :|)
      end
    end

    def flags
      SDL2.SDL_GetWindowFlags(window)
    end

    def fullscreen?
      (flags & SDL_WINDOW_FULLSCREEN) != 0
    end

    def opengl?
      (flags & SDL_WINDOW_OPENGL) != 0
    end

    def shown?
      (flags & SDL_WINDOW_SHOWN) != 0
    end

    def hidden?
      (flags & SDL_WINDOW_HIDDEN) != 0
    end

    def borderless?
      (flags & SDL_WINDOW_BORDERLESS) != 0
    end

    def resizable?
      (flags & SDL_WINDOW_RESIZABLE) != 0
    end

    def minimized?
      (flags & SDL_WINDOW_MINIMIZED) != 0
    end

    def maximized?
      (flags & SDL_WINDOW_MAXIMIZED) != 0
    end

    def input_grabbed?
      (flags & SDL_WINDOW_INPUT_GRABBED) != 0
    end

    def input_focus?
      (flags & SDL_WINDOW_INPUT_FOCUS) != 0
    end

    def mouse_focus?
      (flags & SDL_WINDOW_MOUSE_FOCUS) != 0
    end

    def fullscreen_desktop?
      (flags & SDL_WINDOW_FULLSCREEN_DESKTOP) != 0
    end

    def foreign?
      (flags & SDL_WINDOW_FOREIGN) != 0
    end

    def allow_highdpi?
      (flags & SDL_WINDOW_ALLOW_HIGHDPI) != 0
    end

    def mouse_capture?
      (flags & SDL_WINDOW_MOUSE_CAPTURE) != 0
    end

    def always_on_top?
      (flags & SDL_WINDOW_ALWAYS_ON_TOP) != 0
    end

    def skip_taskbar?
      (flags & SDL_WINDOW_SKIP_TASKBAR) != 0
    end

    def utility?
      (flags & SDL_WINDOW_UTILITY) != 0
    end

    def tooltip?
      (flags & SDL_WINDOW_TOOLTIP) != 0
    end

    def popup_menu?
      (flags & SDL_WINDOW_POPUP_MENU) != 0
    end

    def vulkan?
      (flags & SDL_WINDOW_VULKAN) != 0
    end
  end
end
