class Game

  # Define a limit of failed attempts
  MAX_FAILED_ATTEMPTS = 5
  attr_accessor :word
  attr_accessor :selected_letters

  def initialize
    @word = 'Hangman'.upcase
    @selected_letters = []
  end

  # Accepts a letter, and returns true or false
  # Based on whether the word contains the letter
  # Count how many of the letters are included
  def failed_attempts
    selected_letters.select { |letter| !word.include?(letter) }.size
  end

  # Convert word into an array of it's characters 
  # Then subtract the selected letters from array
  def guessed?
    (word.split('') - selected_letters).empty?
  end

  def finished?
    failed_attempts >= MAX_FAILED_ATTEMPTS || !guessed?
  end

  def select!(letter)
    raise GameOverError if finished?
    selected_letters << letter unless selected_letters.include? letter
    word.include? letter
  end

end
