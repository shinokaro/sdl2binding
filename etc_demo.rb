require_relative './lib/sdl2'
p SDL2.version.to_s
p SDL2.revision
p SDL2.revision_number


info = SDL2::PowerInfo.new
p info.percent
p info.state_name
p info.remaining_time

p SDL2.platform

p SDL2.cpu_count
p SDL2.cpu_cache_line_size
p SDL2.has_rdtsc?
p SDL2.has_alti_vec?
p SDL2.has_mmx?
p SDL2.has_3d_now?
p SDL2.has_sse?
p SDL2.has_sse2?
p SDL2.has_sse3?
p SDL2.has_sse41?
p SDL2.has_sse42?
p SDL2.has_avx?
p SDL2.has_neon?
p SDL2.system_ram


p SDL2.ticks_passed(0, 1)
SDL2.init
SDL2.clipboard_text = nil
p SDL2.clipboard_text?

SDL2.delay 30000
p SDL2.clipboard_text

p SDL2.ticks
p SDL2.performance_counter
p SDL2.performance_frequency

SDL2.clipboard_text= "Finish"
p SDL2.clipboard_text