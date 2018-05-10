use_bpm 72

live_loop :beat do
  sleep 1
end

live_loop :ambient1 do
  with_fx :slicer, phase: 0.125 do
    sample :ambi_choir, rate: (choose [1,0.5,0.666,0.25]), amp: 2
    sleep (choose [3,4])
  end
end

live_loop :ambi2 do
  sample :ambi_piano, rate: (choose [0.5, 0.66666, 0.75, 1]), amp: 4
  sleep 5
end

live_loop :drums do
  with_fx :ixi_techno do
    sample :loop_safari, beat_stretch: 8, amp: 0.5
    sleep 8
  end
end

sync :beat
live_loop :bass do
  with_fx :flanger do
    with_fx :echo, phase: 1.25, decay: 8 do
      use_synth :pretty_bell
      play (choose [:ef3, :g2, :c2]), amp: 0.5
      sleep 2
    end
  end
end
