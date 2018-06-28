# Created by Kennidi Kreisler

in_thread do
  loop do
    sample :ambi_piano
    sleep 1
  end
end
live_loop :guit do
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :guit_em9, rate: 0.5
  end
  sample :guit_em9, rate:-0.5
  sleep 4
end
live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 10, rate: 1
  end
  sleep 4
end
in_thread do
  sample :ambi_haunted_hum
  play 32
  sleep 0.25
  play 35
  sleep 0.25
  play 38
  sleep 0.25
  play 40
  sleep 0.25
  play 42
  sleep 0.25
  play 46
  sleep 0.5
  play 50
  sleep 0.25
  play 55
  sleep 0.25
  play 60
  sleep 0.25
  play 70
  sleep 0.25
  play 80
end
