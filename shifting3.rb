load_samples "/home/jwmatthys/MEGA/compositions/shifting/"

# Shifting Baselines

use_bpm 108
bass = 41
triad_options = [5,3,-2,-5,2,1,6,4,-3,-1]
triad_index = 2
topbell = 72
topbell2 = 79
topbell3 = 64

# triangle distribution
def trirand_i (lo,hi)
  return ((rrand(lo,hi)+rrand(lo,hi))/2).round
end

def closest (target, inputlist)
  bestmatch = 0
  bestdiff = 10000
  for i in inputlist do
    test = (target-i).abs
    if test < bestdiff then
      bestmatch = i
      bestdiff = test
    end
  end
  return bestmatch
end

with_fx :reverb, room: 0.99, mix: 0.7, damp: 0.1 do

  live_loop :change_harmony do
    sleep choose([12,16,20])
    newbass = bass
    newtriad_index = triad_index
    while newbass == bass || newtriad_index == triad_index do
      bass = bass + trirand_i(-4,4)
      if bass < 36 || bass > 52 then
         bass = newbass
      end
      triad_index = triad_index + rrand_i(-1,1)
      if triad_index > 9 || triad_index < 0 then
        triad_index = newtriad_index
      end
    end
triad_val = triad_options[triad_index]
    print 'bass', bass, ', triad: ', triad_val, 'consonance: ', triad_index
end

  live_loop :bassline do
    with_fx :flanger, depth: 20, feedback: 0.5 do
      with_synth :fm do
        play bass+12, attack: 2, release: 10, amp: 0.25
        sleep choose([7,8,9])
      end
    end
  end

  live_loop :arpeggia do
    use_synth :piano
    use_synth_defaults amp: 0.3, release: 2.5, attack: 0.05
    triad_val = triad_options[triad_index]
    8.times do
      (play_pattern_timed shuffle(chord(bass+24+triad_val, :M, num_octaves: 2)), 1/6.0, pan: rrand(-1,1))
end
end #live_loop

live_loop :bells do
  mychord = chord(bass+triad_options[triad_index], :M, num_octaves: 4)
  topbell = closest(topbell, mychord)
  with_fx :echo, phase: choose([1,1,1,0.75,1.25]), decay: 22 do
    with_synth choose([:pretty_bell, :pretty_bell, :beep, :fm, :tri]) do
      play topbell, release: 8, amp: 0.25, pan: 0.85
      sleep 8
    end
  end
end

sleep 11

live_loop :bells2 do
  mychord = chord(bass+triad_options[triad_index], :M, num_octaves: 4)
  topbell2 = closest(topbell2, mychord)
  with_fx :echo, phase: choose([1,1,1,0.75,1.25]), decay: 18 do
    with_synth choose([:pretty_bell, :pretty_bell, :beep, :fm, :tri]) do
      play topbell2, release: 8, amp: 0.25, pan: 0.15
      sleep 9
    end
  end
end

live_loop :bells3 do
  mychord = chord(bass+triad_options[triad_index], :M, num_octaves: 4)
  topbell3 = closest(topbell3, mychord)
  with_fx :echo, phase: choose([1.5,1.5,1.5,1.75,1.25]), decay: 26 do
    with_synth choose([:pretty_bell, :pretty_bell, :beep, :fm, :tri]) do
      play topbell2, release: 8, amp: 0.25
      sleep 13
    end
  end
end

end #reverb
