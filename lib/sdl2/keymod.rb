module SDL2
  class Keymod
    def initialize(state = 0,
                   l_shift: false, r_shift: false, l_ctrl: false, r_ctrl: false,
                   l_alt: false, r_alt: false, l_gui: false, r_gui: false,
                   num: false, caps: false, mode: false)
      @state = state | [l_shift && KMOD_LSHIFT,
                        r_shift && KMOD_RSHIFT,
                        l_ctrl  && KMOD_LCTRL,
                        r_ctrl  && KMOD_RCTRL,
                        l_alt   && KMOD_LALT,
                        r_alt   && KMOD_RALT,
                        l_gui   && KMOD_LGUI,
                        r_gui   && KMOD_RGUI,
                        num     && KMOD_NUM,
                        caps    && KMOD_CAPS,
                        mode    && KMOD_MODE].select(&:itself).inject(0, :|)
    end

    attr_reader :state

    alias to_i state

    def none?
      (@state | KMOD_NONE) == 0
    end

    def l_shift?
      (@state & KMOD_LSHIFT) != 0
    end

    def r_shift?
      (@state & KMOD_RSHIFT) != 0
    end

    def r_ctrl?
      (@state & KMOD_RCTRL) != 0
    end

    def l_alt?
      (@state & KMOD_LART) != 0
    end

    def r_srt?
      (@state & KMOD_RALT) != 0
    end

    def l_gui?
      (@state & KMOD_LGUI) != 0
    end

    def r_gui?
      (@state & KMOD_RGUI) != 0
    end

    def num?
      (@state & KMOD_NUM) != 0
    end

    def caps?
      (@state & KMOD_CAPS) != 0
    end

    def mode?
      (@state & KMOD_MODE) != 0
    end

    def reserved?
      (@state & KMOD_RESERVED) != 0
    end

    def ctrl?
      (@state & KMOD_CTRL) != 0
    end

    def shift?
      (@state & KMOD_SHIFT) != 0
    end

    def alt?
      (@state & KMOD_ALT) != 0
    end

    def gui?
      (@state & KMOD_GUI) != 0
    end
  end
end
