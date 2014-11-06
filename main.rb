require_relative 'lib/word.rb'
require_relative 'lib/game.rb'


def welcome_message
    print " _________     \n";
    print "|         |    \n";
    print "|         0    \n";
    print "|        /|\\  \n";
    print "|        / \\  \n";
    print "|              \n";
    print "|              \n";
    puts "WELCOME TO POKEMON HANGMAN"
    puts "(1) To play"
    puts "(2) To add a pokemon"
    puts "(3) To exit"
    puts "Please make a selection:"
    print ">"
end

word_bank = ["bulbasaur", "ivysaur", "venusaur", "charmander", "charmeleon", "charizard", "squirtle", "wartortle", "blastoise", 
"caterpie", "metapod", "butterfree", "weedle", "kakuna", "beedrill", "pidgey", "pidgeotto", "pidgeot", "rattata", 
"raticate", "spearow", "fearow", "ekans", "arbok", "pikachu", "raichu", "sandshrew", "sandslash", "nidoran", "nidorina", 
"nidoqueen", "nidoran", "nidorino", "nidoking", "clefairy", "clefable", "vulpix", "ninetales", "jigglypuff", "wigglytuff", 
"zubat", "golbat", "oddish", "gloom", "vileplume", "paras", "parasect", "venonat", "venomoth", "diglett", "dugtrio", 
"meowth", "persian", "psyduck", "golduck", "mankey", "primeape", "growlithe", "arcanine", "poliwag", "poliwhirl", 
"poliwrath", "abra", "kadabra", "alakazam", "machop", "machoke", "machamp", "bellsprout", "weepinbell", "victreebel", 
"tentacool", "tentacruel", "geodude", "graveler", "golem", "ponyta", "rapidash", "slowpoke", "slowbro", "magnemite", 
"magneton", "farfetchd", "doduo", "dodrio", "seel", "dewgong", "grimer", "muk", "shellder", "cloyster", "gastly", 
"haunter", "gengar", "onix", "drowzee", "hypno", "krabby", "kingler", "voltorb", "electrode", "exeggcute", "exeggutor", 
"cubone", "marowak", "hitmonlee", "hitmonchan", "lickitung", "koffing", "weezing", "rhyhorn", "rhydon", "chansey", 
"tangela", "kangaskhan", "horsea", "seadra", "goldeen", "seaking", "staryu", "starmie", "mr.mime", "scyther", "jynx", 
"electabuzz", "magmar", "pinsir", "tauros", "magikarp", "gyarados", "lapras", "ditto", "eevee", "vaporeon", "jolteon", 
"flareon", "porygon", "omanyte", "omastar", "kabuto", "kabutops", "aerodactyl", "snorlax", "articuno", "zapdos", "moltres", 
"dratini", "dragonair", "dragonite", "mewtwo", "mew"]


loop do	
	welcome_message
	menu_selection = gets.chomp.to_s
	if menu_selection == "1"
		current_game = Game.new(word_bank)
		current_game.start_game
		loop do
			puts current_game.render
			puts "Select a letter to guess"
			print ">"
	 		letter_to_guess = gets.chomp.to_s
	 		current_game.guess(letter_to_guess)
	 		if current_game.over?
	 			puts current_game.over_message
	 			puts "Would you like to play again? (y)es or (n)o"
	 			play_again = gets.chomp.to_s
	 			if play_again == "y"
	 				current_game = Game.new(word_bank)
					current_game.start_game
	 				next
	 			else
	 				puts "Thank you for playing!"
	 				exit
	 			end
	 		end
		end
	elsif menu_selection == "2"
		puts "Which Pokemon would you like to add to the word bank"
		new_pokemon = gets.chomp.to_s
		word_bank.push(new_pokemon)
	elsif menu_selection == "3"
		puts "Thank you for playing!"
		exit
	else
		puts "You made an incorrect selection"
	end
end
