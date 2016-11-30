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

end
