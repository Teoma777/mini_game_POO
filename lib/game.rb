require 'pry'
require_relative 'player'


#binding.pry
class Game
	attr_accessor :HumanPlayer, :enemies
	def initialize(human_player, enemies=4)

		system 'clear' # Efface le terminal
		puts "------------------------------------------------"
		puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
		puts "|Le but du jeu est d'être le dernier survivant !|"
		puts "-------------------------------------------------"

		@player1 = HumanPlayer.new(human_player) 
		@enemies = [] # Array contenant les adversaires

		@npc0 = Player.new("Josiane") # NPC = Bots
		@npc1 = Player.new("José")
		@npc2 = Player.new("Billy")
		@npc3 = Player.new("Manu")
		@enemies << @npc0
		@enemies << @npc1
		@enemies << @npc2
		@enemies << @npc3

		menu_choice
		binding.pry
	end

	
	def kill_player
			@ennemies.each { |player|
         if (player.life_points < 0) #life_points est défini dans une autre classe
           @ennemies.delete(player)
           puts "#{player.name} is dead"
         end			   }
 	end		

 	def is_still_ongoing? #A FINIR
 		if 	 @player1.life_points > 0 && enemies.count > 0 
 		then 	true end
 		else false end
 		 		#else false 
 		#if @player1.life_points <= 0 || enemies == 0 
 		#then	false 
 		#end
 	end
 
 	def show_players
 		puts "\n Voici ton état : "
		@player1.show_state
		puts "\n Voici le nombre d'ennemis restant : "
		enemies.count
 	end

 	def menu
 		puts " 
	*** Quelle action veux tu effectuer ? *** 

	a - chercher une meilleure arme
	b - chercher a se soigner 

	ATTAQUER un joueur en vue : "
		@i = 0
		while @i != @enemies.count do 
			if @enemies[@i].life_points > 0 
			puts "#{@i} : #{@enemies[@i].name} qui a #{@enemies[@i].life_points} PV"
		end
			@i += 1
	end
 end

	def menu_choice
		puts menu
		puts "Fais ton choix chef"
		print "> "
		@input = gets.chomp

		if @input === "a" then 
        	system 'clear'
			puts "TU CHERCHES UNE MEILLEURE ARME"
			@player1.search_weapon
		end
		if @input === "b" then 
	    	system 'clear'
			puts "TU CHERCHES DU SOIN"
			@player1.search_health_pack
		end

		if @input == "0" then 
	        system 'clear'
			puts "TU ATTAQUES #{@npc0.name}"
			@player1.attacks(@npc0)
		end

		if @input == "1" then 
	        system 'clear'
			puts "TU ATTAQUES #{@npc1.name}"
			@player1.attacks(@npc1)
		end

		if @input == "2" then 
	        system 'clear'
			puts "TU ATTAQUES #{@npc2.name}"
			@player1.attacks(@npc2)
		end
		if @input == "3" then 
	        system 'clear'
			puts "TU ATTAQUES #{@npc3.name}"
			@player1.attacks(@npc3)
		end	
	end

	def enemies_attack
		puts "
	LES ENNEMIS PASSENT A L'ATTAQUE !!! 
	"
  		@enemies.each do  |npc|
  			if npc.life_points >= 1 then
				npc.attacks(@player1) 
			end
	end

	def end
		
	end	
end
 









print "NAME > "
human_player = gets.chomp

my_game = Game.new(human_player)
my_game
