class Game

	def initialize(words)
		@words = words.map { |word| Word.new(word) }
		start_game()
	end

	def start_game
		@guessed_letters = []
		@current_word = @words.sample
		@guesses = 10
	end

	def guesses
		@guesses
	end

	def guess(letter)
		unless @guessed_letters.include?(letter)
			@current_word.try(letter)
			unless @current_word.try(letter)
				@guesses -= 1
			end
		@guessed_letters.push(letter)
		end
	end

	def over?
		if @current_word.found? || @guesses == 0
			return true
		else
			return false
		end
	end

	def over_message
		if @current_word.found?
			puts "The pokemon was #{@current_word.name}"
			return "Winner!"
		elsif @guesses == 0
			puts "The pokemon was #{@current_word.name}"
			return "Better luck next time!"
		else
			return ""
		end
	end

	def render
		return "Your current pokemon is #{@current_word.render}\nYou have #{guesses} guesses left"
	end

end