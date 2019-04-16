require 'pry'

class Player
attr_accessor :name, :life_points
def initialize(name, life_points=10)
	@name = name
	@life_points = life_points
end

def show_state
	 puts "#{@name} a #{@life_points} PV "
	 if @life_points <= 0 then puts "#{@name} est MORT !" end
end
def gets_damage(damage_received)
	@life_points -= damage_received
	if damage_received > 4 then puts "C'est super efficace !!!" end
	if damage_received < 2 then puts"Ca n'est pas tres efficace..." end
			
	puts "#{name} perds #{damage_received} PV !!! #{name} a #{@life_points} PV"
	if @life_points <= 0 then 
		@life_points = 0
		puts "le joueur #{name} a été tué !!!"
end
end

def attacks(player)
	puts "#{@name} attaque #{player.name}" 
	damage_received = compute_damage
	puts "#{name} lui inflige une blessure de #{damage_received} PV"
	player.gets_damage(damage_received)
end

def compute_damage
    return rand(1..6)
end
end

#V1.0 Finie / Ici commence la V2.0

class HumanPlayer < Player
 		attr_accessor :weapon_level
 		def initialize(name, life_points=100, weapon_level=1)
 			@weapon_level = weapon_level
 				super(name, life_points)
 		end

 		def show_state
 				 puts "#{@name} a #{@life_points} PV et une arme de niveau #{weapon_level}"
 		end

 		def compute_damage
 			rand(1..6) * @weapon_level
 		end
		
		def search_weapon
			@new_weapon = rand(1..6) 
			
			if @new_weapon <= @weapon_level then puts "Morbleu cette arme est nulle, tu gardes ton arme de niveau #{@weapon_level}"
			end
			
			if @new_weapon > @weapon_level then  @weapon_level = @new_weapon
			puts "Tu as trouvé une meilleure arme de niveau #{@new_weapon} que tu équipes sur le champs"
			end
		end

		def search_health_pack
			@health_pack = rand(1..6)
			puts "lancé de dé : #{@health_pack}"

			if @health_pack === 1 then puts "Tu n'as rien trouvé..."
			end 
						
			if @health_pack === 6 then 
				@life_points += 80 
				if @life_points > 100 then @life_points = 100
				end
				puts "Tu as trouvé une potion de soin, + 80 PV !! Ta santé est de #{@life_points} PV"
			end 	

			if @health_pack === 2 || @health_pack ===3 || @health_pack ===4 || @health_pack ===5 # Moche mais ne marche que comme ça (else bug)
				@life_points += 50 
				if @life_points > 100 then @life_points = 100
				end
				puts "Tu as trouvé une potion de soin, + 50 PV ! Ta santé est de #{@life_points} PV"
			end 
		end
end



#binding.pry
