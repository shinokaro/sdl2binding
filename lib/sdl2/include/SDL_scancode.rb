module SDL2
  #
  # SDL_scancode.h
  #

  # Enum: SDL_Scancode
  const_set :SDL_SCANCODE_UNKNOWN, 0
  #
  # name Usage page 0x07
  #
  # These values are from usage page 0x07 (USB keyboard page).
  # {
  const_set :SDL_SCANCODE_A, 4
  const_set :SDL_SCANCODE_B, 5
  const_set :SDL_SCANCODE_C, 6
  const_set :SDL_SCANCODE_D, 7
  const_set :SDL_SCANCODE_E, 8
  const_set :SDL_SCANCODE_F, 9
  const_set :SDL_SCANCODE_G, 10
  const_set :SDL_SCANCODE_H, 11
  const_set :SDL_SCANCODE_I, 12
  const_set :SDL_SCANCODE_J, 13
  const_set :SDL_SCANCODE_K, 14
  const_set :SDL_SCANCODE_L, 15
  const_set :SDL_SCANCODE_M, 16
  const_set :SDL_SCANCODE_N, 17
  const_set :SDL_SCANCODE_O, 18
  const_set :SDL_SCANCODE_P, 19
  const_set :SDL_SCANCODE_Q, 20
  const_set :SDL_SCANCODE_R, 21
  const_set :SDL_SCANCODE_S, 22
  const_set :SDL_SCANCODE_T, 23
  const_set :SDL_SCANCODE_U, 24
  const_set :SDL_SCANCODE_V, 25
  const_set :SDL_SCANCODE_W, 26
  const_set :SDL_SCANCODE_X, 27
  const_set :SDL_SCANCODE_Y, 28
  const_set :SDL_SCANCODE_Z, 29

  const_set :SDL_SCANCODE_1, 30
  const_set :SDL_SCANCODE_2, 31
  const_set :SDL_SCANCODE_3, 32
  const_set :SDL_SCANCODE_4, 33
  const_set :SDL_SCANCODE_5, 34
  const_set :SDL_SCANCODE_6, 35
  const_set :SDL_SCANCODE_7, 36
  const_set :SDL_SCANCODE_8, 37
  const_set :SDL_SCANCODE_9, 38
  const_set :SDL_SCANCODE_0, 39

  const_set :SDL_SCANCODE_RETURN,    40
  const_set :SDL_SCANCODE_ESCAPE,    41
  const_set :SDL_SCANCODE_BACKSPACE, 42
  const_set :SDL_SCANCODE_TAB,       43
  const_set :SDL_SCANCODE_SPACE,     44

  const_set :SDL_SCANCODE_MINUS,        45
  const_set :SDL_SCANCODE_EQUALS,       46
  const_set :SDL_SCANCODE_LEFTBRACKET,  47
  const_set :SDL_SCANCODE_RIGHTBRACKET, 48
  const_set :SDL_SCANCODE_BACKSLASH,    49  # Located at the lower left of the return
                                            #  key on ISO keyboards and at the right end
                                            #  of the QWERTY row on ANSI keyboards.
                                            #  Produces REVERSE SOLIDUS (backslash) and
                                            #  VERTICAL LINE in a US layout, REVERSE
                                            #  SOLIDUS and VERTICAL LINE in a UK Mac
                                            #  layout, NUMBER SIGN and TILDE in a UK
                                            #  Windows layout DOLLAR SIGN and POUND SIGN
                                            #  in a Swiss German layout, NUMBER SIGN and
                                            #  APOSTROPHE in a German layout, GRAVE
                                            #  ACCENT and POUND SIGN in a French Mac
                                            #  layout, and ASTERISK and MICRO SIGN in a
                                            #  French Windows layout.
                                            #
  const_set :SDL_SCANCODE_NONUSHASH, 50 # ISO USB keyboards actually use this code
                                        #  instead of 49 for the same key, but all
                                        #  OSes I've seen treat the two codes
                                        #  identically. So, as an implementor, unless
                                        #  your keyboard generates both of those
                                        #  codes and your OS treats them differently,
                                        #  you should generate :SDL_SCANCODE_BACKSLASH
                                        #  instead of this code. As a user, you
                                        #  should not rely on this code because SDL
                                        #  will never generate it with most (all?)
                                        #  keyboards.
                                        #
  const_set :SDL_SCANCODE_SEMICOLON,  51
  const_set :SDL_SCANCODE_APOSTROPHE, 52
  const_set :SDL_SCANCODE_GRAVE,      53  # Located in the top left corner (on both ANSI
                                          #  and ISO keyboards). Produces GRAVE ACCENT and
                                          #  TILDE in a US Windows layout and in US and UK
                                          #  Mac layouts on ANSI keyboards, GRAVE ACCENT
                                          #  and NOT SIGN in a UK Windows layout, SECTION
                                          #  SIGN and PLUS-MINUS SIGN in US and UK Mac
                                          #  layouts on ISO keyboards, SECTION SIGN and
                                          #  DEGREE SIGN in a Swiss German layout (Mac:
                                          #  only on ISO keyboards), CIRCUMFLEX ACCENT and
                                          #  DEGREE SIGN in a German layout (Mac: only on
                                          #  ISO keyboards), SUPERSCRIPT TWO and TILDE in a
                                          #  French Windows layout, COMMERCIAL AT and
                                          #  NUMBER SIGN in a French Mac layout on ISO
                                          #  keyboards, and LESS-THAN SIGN and GREATER-THAN
                                          #  SIGN in a Swiss German, German, or French Mac
                                          #  layout on ANSI keyboards.
                                          #
  const_set :SDL_SCANCODE_COMMA,    54
  const_set :SDL_SCANCODE_PERIOD,   55
  const_set :SDL_SCANCODE_SLASH,    56
  const_set :SDL_SCANCODE_CAPSLOCK, 57
  const_set :SDL_SCANCODE_F1,  58
  const_set :SDL_SCANCODE_F2,  59
  const_set :SDL_SCANCODE_F3,  60
  const_set :SDL_SCANCODE_F4,  61
  const_set :SDL_SCANCODE_F5,  62
  const_set :SDL_SCANCODE_F6,  63
  const_set :SDL_SCANCODE_F7,  64
  const_set :SDL_SCANCODE_F8,  65
  const_set :SDL_SCANCODE_F9,  66
  const_set :SDL_SCANCODE_F10, 67
  const_set :SDL_SCANCODE_F11, 68
  const_set :SDL_SCANCODE_F12, 69
  const_set :SDL_SCANCODE_PRINTSCREEN, 70
  const_set :SDL_SCANCODE_SCROLLLOCK,  71
  const_set :SDL_SCANCODE_PAUSE,  72
  const_set :SDL_SCANCODE_INSERT, 73 # insert on PC, help on some Mac keyboards (but does send code 73, not 117)
  const_set :SDL_SCANCODE_HOME,   74
  const_set :SDL_SCANCODE_PAGEUP, 75
  const_set :SDL_SCANCODE_DELETE, 76
  const_set :SDL_SCANCODE_END,    77
  const_set :SDL_SCANCODE_PAGEDOWN, 78
  const_set :SDL_SCANCODE_RIGHT,    79
  const_set :SDL_SCANCODE_LEFT,     80
  const_set :SDL_SCANCODE_DOWN,     81
  const_set :SDL_SCANCODE_UP,       82
  const_set :SDL_SCANCODE_NUMLOCKCLEAR, 83 # num lock on PC, clear on Mac keyboards
  const_set :SDL_SCANCODE_KP_DIVIDE,    84
  const_set :SDL_SCANCODE_KP_MULTIPLY,  85
  const_set :SDL_SCANCODE_KP_MINUS,     86
  const_set :SDL_SCANCODE_KP_PLUS,      87
  const_set :SDL_SCANCODE_KP_ENTER,     88
  const_set :SDL_SCANCODE_KP_1, 89
  const_set :SDL_SCANCODE_KP_2, 90
  const_set :SDL_SCANCODE_KP_3, 91
  const_set :SDL_SCANCODE_KP_4, 92
  const_set :SDL_SCANCODE_KP_5, 93
  const_set :SDL_SCANCODE_KP_6, 94
  const_set :SDL_SCANCODE_KP_7, 95
  const_set :SDL_SCANCODE_KP_8, 96
  const_set :SDL_SCANCODE_KP_9, 97
  const_set :SDL_SCANCODE_KP_0, 98
  const_set :SDL_SCANCODE_KP_PERIOD, 99
  const_set :SDL_SCANCODE_NONUSBACKSLASH, 100 # This is the additional key that ISO
                                              #  keyboards have over ANSI ones,
                                              #  located between left shift and Y.
                                              #  Produces GRAVE ACCENT and TILDE in a
                                              #  US or UK Mac layout, REVERSE SOLIDUS
                                              #  (backslash) and VERTICAL LINE in a
                                              #  US or UK Windows layout, and
                                              #  LESS-THAN SIGN and GREATER-THAN SIGN
                                              #  in a Swiss German, German, or French
                                              #  layout.
                                              #
  const_set :SDL_SCANCODE_APPLICATION, 101 # windows contextual menu, compose
  const_set :SDL_SCANCODE_POWER, 102  # The USB document says this is a status flag,
                                      #  not a physical key - but some Mac keyboards
                                      #  do have a power key.
                                      #
  const_set :SDL_SCANCODE_KP_EQUALS, 103
  const_set :SDL_SCANCODE_F13, 104
  const_set :SDL_SCANCODE_F14, 105
  const_set :SDL_SCANCODE_F15, 106
  const_set :SDL_SCANCODE_F16, 107
  const_set :SDL_SCANCODE_F17, 108
  const_set :SDL_SCANCODE_F18, 109
  const_set :SDL_SCANCODE_F19, 110
  const_set :SDL_SCANCODE_F20, 111
  const_set :SDL_SCANCODE_F21, 112
  const_set :SDL_SCANCODE_F22, 113
  const_set :SDL_SCANCODE_F23, 114
  const_set :SDL_SCANCODE_F24, 115
  const_set :SDL_SCANCODE_EXECUTE, 116
  const_set :SDL_SCANCODE_HELP,    117
  const_set :SDL_SCANCODE_MENU,    118
  const_set :SDL_SCANCODE_SELECT,  119
  const_set :SDL_SCANCODE_STOP,    120
  const_set :SDL_SCANCODE_AGAIN,   121  # redo
  const_set :SDL_SCANCODE_UNDO,    122
  const_set :SDL_SCANCODE_CUT,     123
  const_set :SDL_SCANCODE_COPY,    124
  const_set :SDL_SCANCODE_PASTE,   125
  const_set :SDL_SCANCODE_FIND,    126
  const_set :SDL_SCANCODE_MUTE,    127
  const_set :SDL_SCANCODE_VOLUMEUP, 128
  const_set :SDL_SCANCODE_VOLUMEDOWN, 129
  # not sure whether there's a reason to enable these
  # const_set SDL_SCANCODE_LOCKINGCAPSLOCK,   130
  # const_set SDL_SCANCODE_LOCKINGNUMLOCK,    131
  # const_set SDL_SCANCODE_LOCKINGSCROLLLOCK, 132
  const_set :SDL_SCANCODE_KP_COMMA, 133
  const_set :SDL_SCANCODE_KP_EQUALSAS400, 134

  const_set :SDL_SCANCODE_INTERNATIONAL1, 135 # used on Asian keyboards, see footnotes in USB doc
  const_set :SDL_SCANCODE_INTERNATIONAL2, 136
  const_set :SDL_SCANCODE_INTERNATIONAL3, 137 # Yen
  const_set :SDL_SCANCODE_INTERNATIONAL4, 138
  const_set :SDL_SCANCODE_INTERNATIONAL5, 139
  const_set :SDL_SCANCODE_INTERNATIONAL6, 140
  const_set :SDL_SCANCODE_INTERNATIONAL7, 141
  const_set :SDL_SCANCODE_INTERNATIONAL8, 142
  const_set :SDL_SCANCODE_INTERNATIONAL9, 143
  const_set :SDL_SCANCODE_LANG1, 144 # Hangul/English toggle
  const_set :SDL_SCANCODE_LANG2, 145 # Hanja conversion
  const_set :SDL_SCANCODE_LANG3, 146 # Katakana
  const_set :SDL_SCANCODE_LANG4, 147 # Hiragana
  const_set :SDL_SCANCODE_LANG5, 148 # Zenkaku/Hankaku
  const_set :SDL_SCANCODE_LANG6, 149 # reserved
  const_set :SDL_SCANCODE_LANG7, 150 # reserved
  const_set :SDL_SCANCODE_LANG8, 151 # reserved
  const_set :SDL_SCANCODE_LANG9, 152 # reserved
  const_set :SDL_SCANCODE_ALTERASE,   153 # Erase-Eaze
  const_set :SDL_SCANCODE_SYSREQ,     154
  const_set :SDL_SCANCODE_CANCEL,     155
  const_set :SDL_SCANCODE_CLEAR,      156
  const_set :SDL_SCANCODE_PRIOR,      157
  const_set :SDL_SCANCODE_RETURN2,    158
  const_set :SDL_SCANCODE_SEPARATOR,  159
  const_set :SDL_SCANCODE_OUT,        160
  const_set :SDL_SCANCODE_OPER,       161
  const_set :SDL_SCANCODE_CLEARAGAIN, 162
  const_set :SDL_SCANCODE_CRSEL,      163
  const_set :SDL_SCANCODE_EXSEL,      164

  const_set :SDL_SCANCODE_KP_00,  176
  const_set :SDL_SCANCODE_KP_000, 177
  const_set :SDL_SCANCODE_THOUSANDSSEPARATOR, 178
  const_set :SDL_SCANCODE_DECIMALSEPARATOR,   179
  const_set :SDL_SCANCODE_CURRENCYUNIT,    180
  const_set :SDL_SCANCODE_CURRENCYSUBUNIT, 181
  const_set :SDL_SCANCODE_KP_LEFTPAREN,    182
  const_set :SDL_SCANCODE_KP_RIGHTPAREN,   183
  const_set :SDL_SCANCODE_KP_LEFTBRACE,    184
  const_set :SDL_SCANCODE_KP_RIGHTBRACE,   185
  const_set :SDL_SCANCODE_KP_TAB,          186
  const_set :SDL_SCANCODE_KP_BACKSPACE,    187
  const_set :SDL_SCANCODE_KP_A, 188
  const_set :SDL_SCANCODE_KP_B, 189
  const_set :SDL_SCANCODE_KP_C, 190
  const_set :SDL_SCANCODE_KP_D, 191
  const_set :SDL_SCANCODE_KP_E, 192
  const_set :SDL_SCANCODE_KP_F, 193
  const_set :SDL_SCANCODE_KP_XOR,     194
  const_set :SDL_SCANCODE_KP_POWER,   195
  const_set :SDL_SCANCODE_KP_PERCENT, 196
  const_set :SDL_SCANCODE_KP_LESS,    197
  const_set :SDL_SCANCODE_KP_GREATER, 198
  const_set :SDL_SCANCODE_KP_AMPERSAND,      199
  const_set :SDL_SCANCODE_KP_DBLAMPERSAND,   200
  const_set :SDL_SCANCODE_KP_VERTICALBAR,    201
  const_set :SDL_SCANCODE_KP_DBLVERTICALBAR, 202
  const_set :SDL_SCANCODE_KP_COLON, 203
  const_set :SDL_SCANCODE_KP_HASH,  204
  const_set :SDL_SCANCODE_KP_SPACE, 205
  const_set :SDL_SCANCODE_KP_AT,    206
  const_set :SDL_SCANCODE_KP_EXCLAM,      207
  const_set :SDL_SCANCODE_KP_MEMSTORE,    208
  const_set :SDL_SCANCODE_KP_MEMRECALL,   209
  const_set :SDL_SCANCODE_KP_MEMCLEAR,    210
  const_set :SDL_SCANCODE_KP_MEMADD,      211
  const_set :SDL_SCANCODE_KP_MEMSUBTRACT, 212
  const_set :SDL_SCANCODE_KP_MEMMULTIPLY, 213
  const_set :SDL_SCANCODE_KP_MEMDIVIDE,   214
  const_set :SDL_SCANCODE_KP_PLUSMINUS,   215
  const_set :SDL_SCANCODE_KP_CLEAR,       216
  const_set :SDL_SCANCODE_KP_CLEARENTRY,  217
  const_set :SDL_SCANCODE_KP_BINARY,      218
  const_set :SDL_SCANCODE_KP_OCTAL,       219
  const_set :SDL_SCANCODE_KP_DECIMAL,     220
  const_set :SDL_SCANCODE_KP_HEXADECIMAL, 221

  const_set :SDL_SCANCODE_LCTRL,  224
  const_set :SDL_SCANCODE_LSHIFT, 225
  const_set :SDL_SCANCODE_LALT,   226 # alt, option
  const_set :SDL_SCANCODE_LGUI,   227 # windows, command (apple), meta
  const_set :SDL_SCANCODE_RCTRL,  228
  const_set :SDL_SCANCODE_RSHIFT, 229
  const_set :SDL_SCANCODE_RALT,   230 # alt gr, option
  const_set :SDL_SCANCODE_RGUI,   231 # windows, command (apple), meta

  const_set :SDL_SCANCODE_MODE,   257 # I'm not sure if this is really not covered
                                      #   by any of the above, but since there's a
                                      #   special KMOD_MODE for it I'm adding it here
  # } Usage page 0x07

  #
  # name Usage page 0x0C
  #
  # These values are mapped from usage page 0x0C (USB consumer page).
  # {
  const_set :SDL_SCANCODE_AUDIONEXT,    258
  const_set :SDL_SCANCODE_AUDIOPREV,    259
  const_set :SDL_SCANCODE_AUDIOSTOP,    260
  const_set :SDL_SCANCODE_AUDIOPLAY,    261
  const_set :SDL_SCANCODE_AUDIOMUTE,    262
  const_set :SDL_SCANCODE_MEDIASELECT,  263
  const_set :SDL_SCANCODE_WWW,          264
  const_set :SDL_SCANCODE_MAIL,         265
  const_set :SDL_SCANCODE_CALCULATOR,   266
  const_set :SDL_SCANCODE_COMPUTER,     267
  const_set :SDL_SCANCODE_AC_SEARCH,    268
  const_set :SDL_SCANCODE_AC_HOME,      269
  const_set :SDL_SCANCODE_AC_BACK,      270
  const_set :SDL_SCANCODE_AC_FORWARD,   271
  const_set :SDL_SCANCODE_AC_STOP,      272
  const_set :SDL_SCANCODE_AC_REFRESH,   273
  const_set :SDL_SCANCODE_AC_BOOKMARKS, 274
  # } Usage page 0x0C

  #
  # name Walther keys
  #
  # These are values that Christian Walther added (for mac keyboard?).
  # {
  const_set :SDL_SCANCODE_BRIGHTNESSDOWN, 275
  const_set :SDL_SCANCODE_BRIGHTNESSUP,   276
  const_set :SDL_SCANCODE_DISPLAYSWITCH,  277 # display mirroring/dual display switch, video mode switch
  const_set :SDL_SCANCODE_KBDILLUMTOGGLE, 278
  const_set :SDL_SCANCODE_KBDILLUMDOWN,   279
  const_set :SDL_SCANCODE_KBDILLUMUP,     280
  const_set :SDL_SCANCODE_EJECT,          281
  const_set :SDL_SCANCODE_SLEEP,          282
  const_set :SDL_SCANCODE_APP1,           283
  const_set :SDL_SCANCODE_APP2,           284
  # } Walther keys

  #
  # name Usage page 0x0C (additional media keys)
  #
  # These values are mapped from usage page 0x0C (USB consumer page).
  # {
  const_set :SDL_SCANCODE_AUDIOREWIND,      285
  const_set :SDL_SCANCODE_AUDIOFASTFORWARD, 286
  # } Usage page 0x0C (additional media keys)

  # Add any other keys here.
  const_set :SDL_NUM_SCANCODES, 512 # not a key, just marks the number of scancodes for array bounds;

  typealias 'SDL_Scancode', 'int'
end
