#melody1 = [64, 64, 64, nil, 64, 64, 64, nil, 64, 67, 60, 62, 64, nil, nil, nil]
#melody2 = [60, 60, 67, 67, 69, 69, 67, nil, 65, 65, 64, 64, 62, 62, 60, nil]

melody1 = [62, 62, 64, 66, 67, 67, 66, 66, 67, 69, 62, 69, 70, 71]
melody2 = [67, 67, 67, 65, 65, 65, 65, 64, 64, 64, 64, 62, 62, nil]

#melody1 = [66, 66, 67, 69, 69, 67, 66, 64, 62, 62, 64, 66, 66, 64, 64]
#melody2 = [67, 64, 69, 67, 72, 72, 71, 72, 67, 72, 67, 69, 66, 67, nil]

separator = 0

use_bpm 240
use_synth :piano
use_synth_defaults sustain: 1

live_loop :widen do
  sleep (melody2.length + 4)
  separator = separator + 1
end

live_loop :interleave do
  (melody2.length+1).times do
    play melody1.look + separator
    sleep 0.5
    play melody2.look - separator
    sleep 0.5
    melody1.tick
  end
  sync :widen
end
