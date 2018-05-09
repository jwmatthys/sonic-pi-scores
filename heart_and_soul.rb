use_bpm 120
accompaniment = [48, 48, (chord 48, 'M'), (chord 48, 'M'),
                 45, 45, (chord 45, 'm'),(chord 45, 'm'),
                 41, 41, (chord 41, 'M'),(chord 41, 'M'),
                 43, 43, (chord 43, 'M'),(chord 43, 'M')]

use_synth :piano
live_loop :lefthand do
  play_pattern_timed accompaniment, [0.67, 0.33]
end

melodyPhrase1 = [72, 72, 72, 72, 71, 69, 71, 72, 74, 76, 76, 76, 76, 74, 72, 74, 76, 77]
rhythmPhrase1 = [1, 1, 2.67, 0.33, 0.67, 0.33, 0.67, 0.33, 1]
melodyPhrase2a = [79, 72, 81, 79, 77, 76, 74]
rhythmPhrase2a = [2, 2.67, 0.33, 0.67, 0.33, 1, 1]
melodyPhrase2b = [72, 74, 76, 77, 79, 77, 76, 74]
rhythmPhrase2b = [2.67, 0.33, 0.67, 0.33, 1, 0.67, 0.33, 2]

live_loop :righthand do
  play_pattern_timed melodyPhrase1, rhythmPhrase1
  play_pattern_timed melodyPhrase2a, rhythmPhrase2a
  play_pattern_timed melodyPhrase2b, rhythmPhrase2b
end
