# require_relative 'dictionary.txt'
require 'set'

class Game
  attr_reader :dictionary, :fragment

  def initialize(player1, player2)
    @fragment = ""
    @player1 = player1
    @player2 = player2
    @dictionary = read_dictionary
  end

  def read_dictionary
    dict = Set.new
    File.readlines("dictionary.txt").each { |line| dict.add(line.chomp) }
    dict
  end

  def play_round

  end

  def current_player
  end

  def previous_player
  end

  def next_player!
  end

  def take_turn(player)
    guess = player.guess

    if valid_play?(guess)
      @fragment += guess
    end

  end

  def valid_play?(string)
    # Check if input is a letter of the alphabet
    return false if ("a".."z").include?(string.downcase)
    return false if string.length != 1
  end

  def valid_fragment?(fragment)
    # Check that new fragment is valid
    @dictionary.each do |word|
      if word[0, fragment.length] == fragment
        return true
      end
    end
    false
  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    print "What is the next letter?"
    @guess = $stdin.gets.chomp
  end

  def alert_invalid_guess
  end
end

__FILE__ == $PROGRAM_NAME
player1 = Player.new("Lisa")
player2 = Player.new("Michael")
game = Game.new(player1, player2)
puts game.dictionary.size()
p game.valid_fragment?("abdz")
