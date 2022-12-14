##| Dejie Zhen
##| CSCI 3725
##| December 14, 2022

##| Background bass drum beat with bd_haus sample
in_thread do
  live_loop :bass_drum do
    tick
    sample :bd_haus, cutoff: 70, amp: 1
    sleep 0.5
  end
end

##| Background drum beat with drum kick, bass, and tom hi
##| Credits to Professor Harmon!
in_thread do
  live_loop :professor_beat do
    tick
    sample :drum_heavy_kick, amp: (ring 1,0,0,0, 1,0,0,0, 1,0,0,0.5, 1,0,0.5,0).look
    sample :drum_bass_hard,
      amp: (ring 0,0,0.5,0).look,
      start: 1,
      finish: 0.05,
      release: 0.3
    sample :drum_tom_hi_soft,
      amp: (ring 0,0,0,0, 0.5,0,0,0).look
    sleep 0.25
  end
end

##| Function to invert the chords
define :invert_chords do |some_chord|
  return some_chord[1..2] + [some_chord[0] + 12]
end

##| Wake up, beginning stages of the day!
##| Chord Progression: Cmin11, Fmin9, Cmin11, GSus4
define :beginning do
  play chord(:C3, :m11), release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play chord(:F3, :m9), release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play chord(:C3, :m11), release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play chord(:G3, :sus4), release: rrand(2, 4), sustain: 1.5
  sleep 1.5
end

##| Inverted beginning, representing the ending of a beginning
##| Inverted all chords from beginning
define :inverted_beginning do
  inverted_cmin11 = invert_chords(chord(:C3, :m11))
  inverted_fmin9 = invert_chords(chord(:F3, :m9))
  inverted_cmin11 = invert_chords(chord(:C3, :m11))
  inverted_gmin7 = invert_chords(chord(:G3, :m7))
  
  play inverted_cmin11, release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play inverted_fmin9, release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play inverted_cmin11, release: rrand(2, 4), sustain: 1.5
  sleep 1.5
  play inverted_gmin7, release: rrand(2, 4), sustain: 1.5
  sleep 1.5
end

##| The long journey throughout our day, changed feel of song
##| Chord Progression: Dmin11, Gmin7, Dmin11, Ebmin11, Csdim7
define :long_journey do
  use_synth :piano
  
  play chord(:D3, :m11), release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play chord(:G3, :minor7), release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play chord(:D3, :m11), release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play chord(:Eb3, :m11), release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play chord(:Cs3, :dim7), release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
end

##| Restoring from our previous point, connects our long journeys
##| Inverted all chords from long journey
define :inverted_long_journey do
  use_synth :piano
  inverted_dmin11 = invert_chords(chord(:D3, :m11))
  inverted_gminm7 = invert_chords(chord(:G3, :minor7))
  inverted_dminm11 = invert_chords(chord(:D3, :m11))
  inverted_ebminm11 = invert_chords(chord(:Eb3, :m11))
  inverted_csdim7 = invert_chords(chord(:Cs3, :dim7))
  
  play inverted_dmin11 , release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play inverted_gminm7, release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play inverted_dminm11, release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play inverted_ebminm11, release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
  play inverted_csdim7, release: rrand(4, 5), sustain: rrand(1, 2)
  sleep 1.5
end

##| Keeps steady pace of song, representing our daydreaming
##| Chord Progression: Gmaj7, F#min7, Am7b5
define :daydream do
  play chord(:G3, :major7), release: rrand(2, 4), sustain: 1
  sleep 1.5
  play chord(:Fs3, :minor7), release: rrand(2, 4), sustain: 1
  sleep 1.5
  play chord(:A3, :m7b5), release: rrand(2, 4), sustain: 1
  sleep 1.5
end

##| Inverted all chords from daydream
define :inverted_daydream do
  inverted_gmajor7 = invert_chords(chord(:G3, :major7))
  inverted_fsm7 = invert_chords(chord(:Fs3, :minor7))
  inverted_am7b5 = invert_chords(chord(:A3, :m7b5))
  
  play inverted_gmajor7, release: rrand(2, 4), sustain: 1
  sleep 1.5
  play inverted_fsm7, release: rrand(2, 4), sustain: 1
  sleep 1.5
  play inverted_am7b5, release: rrand(2, 4), sustain: 1
  sleep 1.5
end

##| Gaining energy to start our day
##| Chord Progression: Fmin9, Ebmaj9
define :sunrise do
  play chord(:F3, :m9), release: rrand(2, 4), sustain: 1
  sleep 1.5
  play chord(:Eb3, :maj9), release: rrand(2, 4), sustain: 1
  sleep 1.5
end

##| Inverted chords from sunrise
define :inverted_sunrise do
  inverted_fmin9 = invert_chords(chord(:F3, :m9))
  inverted_ebmaj9 = invert_chords(chord(:Eb3, :maj9))
  
  play inverted_fmin9, release: rrand(2, 4), sustain: 1
  sleep 1.5
  play inverted_ebmaj9, release: rrand(2, 4), sustain: 1
  sleep 1.5
end

##| Ending our day, preparing for wind down
##| Chord Progression: F#maj9, Bmaj9, Amaj9, Emaj9, F#maj9, Bmaj9, Amaj9, Dmaj9
define :ending do
  use_synth :piano
  play chord(:Fs3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:B3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:A3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:E3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:Fs3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:B3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:A3, :maj9), release: 4, sustain: 2
  sleep 1.5
  play chord(:D3, :maj9), release: 4, sustain: 2
  sleep 1.5
end

##| This section inspired by https://github.com/Ronovo/Turing-Test-Media/blob/master/Singles/Ronovo%20Ronove/Lo%20Fi%20Beats/End%20of%20Life%20(Untitled%201)/end%20of%20life%20live%20start.rb
##| Catchy beat that is used in intro, middle, and end
define :eternal do
  use_bpm 45
  play :F4
  play chord(:D3, :m11), release: 3, sustain: 2
  sleep 1.5
  play :A3
  sleep 1.5
  play :D4
  play chord(:C3, :m7), release: 3, sustain: 2
  sleep 1.5
  play :C4
  sleep 1.5
  play :D4
  play chord(:B2, :m7), release: 3, sustain: 2
  sleep 1.5
  play :A4
  sleep 1.5
  play :A3
  play chord(:As2, :m7), release: 3, sustain: 2
  sleep 1.5
  play :G4
  sleep 1.5
end

##| First half of our day
##| Incorporates the different stages in the morning
define :first_half do
  1.times do
    beginning
  end
  2.times do
    daydream
    sleep 1.5
  end
  2.times do
    sunrise
    sleep 1.5
  end
  2.times do
    long_journey
  end
  
  with_synth :blade do
    eternal
  end
  
  2.times do
    inverted_long_journey
  end
  2.times do
    inverted_sunrise
  end
  sleep 1.5
  2.times do
    inverted_daydream
  end
  sleep 1.5
  1.times do
    inverted_beginning
  end
  
  with_synth :blade do
    eternal
  end
end

##| Second half of our day, limited energy
define :second_half do
  1.times do
    beginning
  end
  sleep 1.5
  2.times do
    inverted_daydream
  end
  sleep 1.5
  2.times do
    sunrise
  end
  sleep 1.5
  2.times do
    inverted_long_journey
  end
  with_synth :blade do
    eternal
  end
  
  2.times do
    long_journey
  end
  2.times do
    inverted_sunrise
    sleep 1.5
  end
  2.times do
    daydream
    sleep 1.5
  end
  1.times do
    inverted_beginning
  end
  with_synth :blade do
    eternal
  end
end

##| Song models daily human behavior and attention
in_thread do
  use_bpm 45
  eternal
  sleep 1.5
  
  first_half
  sleep 1.5
  second_half
  sleep 1.5
  
  ending
  sleep 1.5
  eternal
end