require 'pry'

class Player
attr_accessor :name, :life_points
def initialize(name, life_points=10)
	@name = name
	@life_points = life_points

end
def show_state
	 puts "#{@name} a #{@life_points} points de vie "
end
def gets_damage(damage_received)
	@life_points -= damage_received
	puts "#{name} perds #{damage_received} points de vie !!! #{name} a #{@life_points} points de vie"
	if @life_points <= 0 then puts "le joueur #{name} a été tué"
end
end

def attacks(player)
	puts "#{@name} attaque #{player.name}" 
	damage_received = compute_damage
	puts "il lui inflige #{damage_received} points de dégats"


	player.gets_damage(damage_received)

	#player.life_points = player.life_points - damage
end

def compute_damage
    return rand(1..6)
end



end