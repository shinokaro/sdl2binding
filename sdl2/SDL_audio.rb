module SDL2
  module SDL_Audio
    #
    # SDL_audio.h
    #
    AUDIO_U8     = 0x0008 # Unsigned 8-bit samples
    AUDIO_S8     = 0x8008 # Signed 8-bit samples
    AUDIO_U16LSB = 0x0010 # Unsigned 16-bit samples
    AUDIO_S16LSB = 0x8010 # Signed 16-bit samples
    AUDIO_U16MSB = 0x1010 # As above, but big-endian byte order
    AUDIO_S16MSB = 0x9010 # As above, but big-endian byte order
    AUDIO_U16    = AUDIO_U16LSB
    AUDIO_S16    = AUDIO_S16LSB
    AUDIO_S32LSB = 0x8020 # 32-bit integer samples
    AUDIO_S32MSB = 0x9020 # As above, but big-endian byte order
    AUDIO_S32    = AUDIO_S32LSB

    AUDIO_F32LSB = 0x8120 # 32-bit floating point samples
    AUDIO_F32MSB = 0x9120 # As above, but big-endian byte order
    AUDIO_F32    = AUDIO_F32LSB

    if true #SDL_BYTEORDER == SDL_LIL_ENDIAN
      AUDIO_U16SYS = AUDIO_U16LSB
      AUDIO_S16SYS = AUDIO_S16LSB
      AUDIO_S32SYS = AUDIO_S32LSB
      AUDIO_F32SYS = AUDIO_F32LSB
    else
      AUDIO_U16SYS = AUDIO_U16MSB
      AUDIO_S16SYS = AUDIO_S16MSB
      AUDIO_S32SYS = AUDIO_S32MSB
      AUDIO_F32SYS = AUDIO_F32MSB
    end

    SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
    SDL_AUDIO_ALLOW_FORMAT_CHANGE    = 0x00000002
    SDL_AUDIO_ALLOW_CHANNELS_CHANGE  = 0x00000004
    SDL_AUDIO_ALLOW_ANY_CHANGE       = SDL_AUDIO_ALLOW_FREQUENCY_CHANGE |
                                       SDL_AUDIO_ALLOW_FORMAT_CHANGE |
                                       SDL_AUDIO_ALLOW_CHANNELS_CHANGE

    SDL_MIX_MAXVOLUME = 128

    def included(m)
      m.module_eval {
        typealias 'SDL_AudioFormat', 'Uint16 '

        const_set :SDL_AUDIO_MASK_BITSIZE,   0xFF
        const_set :SDL_AUDIO_MASK_DATATYPE,  (1<<8)
        const_set :SDL_AUDIO_MASK_ENDIAN,    (1<<12)
        const_set :SDL_AUDIO_MASK_SIGNED,    (1<<15)
        const_set :SDL_AUDIO_BITSIZE,        -> (x) { (x & SDL_AUDIO_MASK_BITSIZE) }
        const_set :SDL_AUDIO_ISFLOAT,        -> (x) { (x & SDL_AUDIO_MASK_DATATYPE) }
        const_set :SDL_AUDIO_ISBIGENDIAN,    -> (x) { (x & SDL_AUDIO_MASK_ENDIAN) }
        const_set :SDL_AUDIO_ISSIGNED,       -> (x) { (x & SDL_AUDIO_MASK_SIGNED) }
        const_set :SDL_AUDIO_ISINT,          -> (x) { !SDL_AUDIO_ISFLOAT[x] }
        const_set :SDL_AUDIO_ISLITTLEENDIAN, -> (x) { !SDL_AUDIO_ISBIGENDIAN[x] }
        const_set :SDL_AUDIO_ISUNSIGNED,     -> (x) { !SDL_AUDIO_ISSIGNED[x] }
        #
        # typedef void (*SDL_AudioCallback) (void *userdata, Uint8 *stream, int len);
        typealias 'SDL_AudioCallback', 'void*' # callback function

        const_set :SDL_AudioSpec, struct([
            'int freq',                   # DSP frequency -- samples per second
            'SDL_AudioFormat format',     # Audio data format
            'Uint8 channels',             # Number of channels: 1 mono, 2 stereo
            'Uint8 silence',              # Audio buffer silence value (calculated)
            'Uint16 samples',             # Audio buffer size in sample FRAMES (total samples divided by channel count)
            'Uint16 padding',             # Necessary for some compile environments
            'Uint32 size',                # Audio buffer size in bytes (calculated)
            'SDL_AudioCallback callback', # Callback that feeds the audio device (NULL to use SDL_QueueAudio()).
            'void *userdata'              # Userdata passed to callback (ignored for NULL callbacks).
        ])
        typealias 'SDL_AudioSpec', 'void*'

        #typedef void (*SDL_AudioFilter) (struct SDL_AudioCVT *cvt, SDL_AudioFormat format);
        typealias 'SDL_AudioFilter', 'void*' # callback function

        const_set :SDL_AUDIOCVT_MAX_FILTERS, 9 # Upper limit of filters in SDL_AudioCVT

        const_set :SDL_AudioCVT, struct([
            'int needed',                 # Set to 1 if conversion possible
            'SDL_AudioFormat src_format', # Source audio format
            'SDL_AudioFormat dst_format', # Target audio format
            'double rate_incr',           # Rate conversion increment
            'Uint8 *buf',                 # Buffer to hold entire audio data
            'int len',                    # Length of original audio buffer
            'int len_cvt',                # Length of converted audio buffer
            'int len_mult',               # buffer must be len*len_mult big
            'double len_ratio',           # Given len, final size is len*len_ratio
            "SDL_AudioFilter filters[#{SDL_AUDIOCVT_MAX_FILTERS + 1}]", # NULL-terminated list of filter functions
            'int filter_index'           # Current audio conversion function
        ])
        typealias 'SDL_AudioCVT', 'void*'

        extern 'int SDL_GetNumAudioDrivers(void)'
        extern 'const char *SDL_GetAudioDriver(int index)'
        extern 'int SDL_AudioInit(const char *driver_name)'
        extern 'void SDL_AudioQuit(void)'
        extern 'const char *SDL_GetCurrentAudioDriver(void)'
        extern 'int SDL_OpenAudio(SDL_AudioSpec *desired, SDL_AudioSpec *obtained)'

        typealias 'SDL_AudioDeviceID', 'Uint32'

        extern 'int SDL_GetNumAudioDevices(int iscapture)'
        extern 'const char *SDL_GetAudioDeviceName(int index, int iscapture)'
        extern 'SDL_AudioDeviceID SDL_OpenAudioDevice(const char *device, int iscapture,
                                                const SDL_AudioSpec *desired,
                                                SDL_AudioSpec *obtained,
                                                int allowed_changes)'
        # enum: Audio state
        const_set :SDL_AUDIO_STOPPED, 0
        const_set :SDL_AUDIO_PLAYING, 1
        const_set :SDL_AUDIO_PAUSED,  2
        typealias 'SDL_AudioStatus', 'int'

        extern 'SDL_AudioStatus SDL_GetAudioStatus(void)'
        extern 'SDL_AudioStatus SDL_GetAudioDeviceStatus(SDL_AudioDeviceID dev)'
        extern 'void SDL_PauseAudio(int pause_on)'
        extern 'void SDL_PauseAudioDevice(SDL_AudioDeviceID dev, int pause_on)'
        extern 'SDL_AudioSpec *SDL_LoadWAV_RW(SDL_RWops *src, int freesrc,
                                        SDL_AudioSpec *spec, Uint8 **audio_buf,
                                        Uint32 *audio_len)'

        const_set :SDL_LoadWAV, -> (file, spec, audio_buf, audio_len) {
          SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1, spec, audio_buf, audio_len)
        }

        extern 'void SDL_FreeWAV(Uint8 *audio_buf);'
        extern 'int SDL_BuildAudioCVT(SDL_AudioCVT *cvt, SDL_AudioFormat src_format,
                                Uint8 src_channels, int src_rate,
                                SDL_AudioFormat dst_format, Uint8 dst_channels,
                                int dst_rate);'
        extern 'int SDL_ConvertAudio(SDL_AudioCVT *cvt);'

        typealias 'SDL_AudioStream', 'void*'
        extern 'SDL_AudioStream *SDL_NewAudioStream(SDL_AudioFormat src_format,
                                              Uint8 src_channels, int src_rate,
                                              SDL_AudioFormat dst_format,
                                              Uint8 dst_channels, int dst_rate)'
        extern 'int SDL_AudioStreamPut(SDL_AudioStream *stream, const void *buf, int len)'
        extern 'int SDL_AudioStreamGet(SDL_AudioStream *stream, void *buf, int len)'
        extern 'int SDL_AudioStreamAvailable(SDL_AudioStream *stream)'
        extern 'int SDL_AudioStreamFlush(SDL_AudioStream *stream)'
        extern 'void SDL_AudioStreamClear(SDL_AudioStream *stream)'
        extern 'void SDL_FreeAudioStream(SDL_AudioStream *stream)'

        extern 'void   SDL_MixAudio(Uint8 *dst, const Uint8 *src, Uint32 len, int volume)'
        extern 'void   SDL_MixAudioFormat(Uint8 *dst, const Uint8 *src,
                                    SDL_AudioFormat format, Uint32 len, int volume)'
        extern 'int    SDL_QueueAudio(SDL_AudioDeviceID dev, const void *data, Uint32 len)'
        extern 'Uint32 SDL_DequeueAudio(SDL_AudioDeviceID dev, void *data, Uint32 len)'
        extern 'Uint32 SDL_GetQueuedAudioSize(SDL_AudioDeviceID dev)'
        extern 'void   SDL_ClearQueuedAudio(SDL_AudioDeviceID dev)'
        extern 'void   SDL_LockAudio(void)'
        extern 'void   SDL_LockAudioDevice(SDL_AudioDeviceID dev)'
        extern 'void   SDL_UnlockAudio(void)'
        extern 'void   SDL_UnlockAudioDevice(SDL_AudioDeviceID dev)'
        extern 'void   SDL_CloseAudio(void)'
        extern 'void   SDL_CloseAudioDevice(SDL_AudioDeviceID dev)'
      }
    end
    module_function :included
  end
end
