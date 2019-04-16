require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

print "NAME > "
human_player = gets.chomp

my_game = Game.new(human_player)
my_game
#binding.pry