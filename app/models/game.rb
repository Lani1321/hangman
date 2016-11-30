class Game
  include ActiveModel::AttributeMethods, ActiveModel::Serializers::JSON

  class GameOverError < StandardError; end

  # Define a limit of failed attempts
  MAX_FAILED_ATTEMPTS = 5
  attr_accessor :word
  attr_accessor :selected_letters

  def initialize
    @word = 'Hangman'.upcase
    @selected_letters = []
  end

  # Declare an attributes hash which contains the attributes I want to serialize
  def attributes
    {'word' => nil,
     'selected_letters' => nil}
  end

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
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
