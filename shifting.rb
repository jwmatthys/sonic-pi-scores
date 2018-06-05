# Shifting Baselines

use_bpm 108
bass = 41
triad_options = [5,3,-2,-5,2,1,6,4,-3,-1]
triad_index = 2
topbell = 72

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

live_loop :joel_harmony do
  use_synth :piano
  use_synth_defaults amp: 1, release: 3, attack: 0.1
    triad_val = triad_options[triad_index]
  print 'bass', bass, ', triad: ', triad_val, 'consonance: ', triad_index
    with_fx :flanger do
      with_synth :fm do
        play bass, attack: 4, release: 17, amp: 3
      end
    end
    choose([16,24]).times do
      play_pattern_timed shuffle(chord(bass+24+triad_val, :M, num_octaves: 2)), 1/6.0, pan: rrand(-1,1)
          end
          newbass = bass
          newtriad_index = triad_index
          while newbass == bass || newtriad_index == triad_index do
              bass = bass + trirand_i(-3,3)
              if bass < 36 || bass > 52 then
                bass = newbass
              end
              triad_index = triad_index + rrand_i(-1,1)
              if triad_index > 9 || triad_index < 0 then
                triad_index = newtriad_index
              end
            end
          end #live_loop
          
          live_loop :bells do
            mychord = chord(bass+triad_options[triad_index], :M, num_octaves: 4)
            topbell = closest(topbell, mychord)
            with_fx :echo, phase: 1, decay: 16 do
              with_synth :pretty_bell do
                play topbell, release: 8
                sleep 8
              end
            end
          end
          
          end #reverb
          
