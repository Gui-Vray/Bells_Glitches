# Coded by Guillaume Auvray
#
# Who would have thought that such a small code could offer us
# such an interesting acoustic effects? :)
#
# Code v2018.06.14-1636
# Sonic Pi v3.1.0


in_thread(name: :evolving_bells) do
  live_loop :glitches do
    with_fx :reverb, room: 0.6, mix: 0.8, amp: 3 do
      with_fx :slicer, mix: 0.6, probability: 0.2 do
        with_fx :echo, phase: rrand(0.05, 0.2), decay: rrand(0.5, 2), mix: 0.4 do
          with_fx :mono do
            sample :perc_bell, rate: rrand(-100, 100)
            sleep rrand(0.001, 2)
            if one_in (6)
              sample :perc_bell, rate: rrand(-30, 30), amp: 0.1
            end
            if one_in (3)
              sample :perc_bell, rate: rrand(-0.1, -0.001), amp: 0.6
            end
            sleep rrand(0.001, 6)
          end
        end
      end
    end
  end
end

in_thread(name: :choirpad) do
  live_loop :boom_choir do
    if one_in (5)
      with_fx :reverb, mix: 0.8, room: 0.9 do
        sample :ambi_choir, rate: 0.03125, amp: 0.4
        sample :ambi_choir, rate: 0.0625, amp: 0.3
        sample :ambi_choir, rate: 0.125, amp: 0.2
        sample :ambi_choir, rate: 0.25, amp: 0.1
        sample :ambi_choir, rate: 0.40, amp: 0.05
        sample :ambi_choir, rate: 1.20, amp: 0.01
        sample :ambi_choir, rate: 1.43, amp: 0.005
        sample :ambi_choir, rate: 1.746, amp: 0.004
      end
    end
    if one_in (9)
      with_fx :reverb, mix: 0.6, room: 0.6 do
        with_fx :distortion, distort: 0.2, mix: 0.2 do
          sample :bd_boom, rate: 0.35, amp: 5, attack: 0.1, release: 2
        end
      end
    end
    sleep 10
  end
end