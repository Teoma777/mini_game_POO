require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



system 'clear' # Efface le terminal
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "\n \n Quel est ton nom Héro ? "
print "> "
nom = gets.chomp
player1 = HumanPlayer.new(nom)  # player1 est l'HUMAIN
system 'clear' 
puts "* * * * * * * * * * * * * * * * * * * * * * * * "
#puts "Voici tes stats champion : \n"
#player1.show_state

enemies = [] # Array contenant les adversaires

npc1 = Player.new("Josiane") # NPC = Bots
npc2 = Player.new("José")

enemies << npc1 
enemies << npc2
puts " \n"
puts " *** Voici l'état de tes ennemis : ***"
npc1.show_state
npc2.show_state


while player1.life_points >0 && (npc1.life_points > 0 || npc2.life_points >0)
	puts "\n Voici ton état : "
	player1.show_state
	puts " 
	*** Quelle action veux tu effectuer ? *** 

	a - chercher une meilleure arme
	b - chercher a se soigner 

	ATTAQUER un joueur en vue : 

	0 - #{npc1.name} qui a #{npc1.life_points} PVS
	1 - #{npc2.name} qui a #{npc2.life_points} PVS"
	puts "\n"
	puts "Fais ton choix chef"
	print "> "
	input = gets.chomp
	#if input != ""
	if input === "a" then 
        system 'clear'
		puts "TU CHERCHES UNE MEILLEURE ARME"
		player1.search_weapon
	end
	if input === "b" then 
        system 'clear'
		puts "TU CHERCHES DU SOIN"
		player1.search_health_pack
	end

	if input === "0" then 
        system 'clear'
		puts "TU ATTAQUES #{npc1.name}"
		player1.attacks(npc1)
	end
	if input === "1" then 
        system 'clear'
		puts "TU ATTAQUES #{npc2.name}"
	 	player1.attacks(npc2)
	end

#system'clear'
	puts "
	LES ENNEMIS PASSENT A L'ATTAQUE !!! 
	"
  		enemies.each do  |npc|
  			if npc.life_points >= 1 then
				npc.attacks(player1) 
			end
	end
end






#npc1.attacks(player1)
#npc2.attacks(player1)

#else puts "WRONG INPUT FDP"











if player1.life_points > 0 then 
	puts "bravo tu as gagné" 
end

if player1.life_points < 1 then  
	puts "LOOOOOOOOOOSER" end



binding.pry



#V1.0 GAMEPLAY : IA VS IA




