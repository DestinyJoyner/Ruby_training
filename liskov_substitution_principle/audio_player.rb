# Liskov Substitution Principle (LSP)
class AudioPlayer
  def initialize(file)
    @file = file
  end

  def play
    puts "Playing audio file: #{@file}"
  end
end

class PremiumAudioPlayer < AudioPlayer
  def initialize(file)
    super(file)
  end

  # redundant it already inherits method
  # def play
  #   puts "Playing audio file: #{@file}"
  # end

  def set_speed(speed)
    if speed >= 0.5 && speed <= 2.0
      @speed = speed
      puts "Playback speed set to #{@speed}"
    else
      raise "Invalid speed. Speed must be between 0.5 and 2.0."
    end
  end
end