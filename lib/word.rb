require 'pry'

class Word

	def initialize(word)
		@word = word
		@letters = word.split("").map do |letter|
			{
				:letter => letter,
				:hidden => true
			}
		end
	end

	def name
		@word
	end

	def found?
		@letters.all? do |hash| 
			hash[:hidden] == false 
			end
	end

	def try(letter)
		found = false
		@letters.each do |hash|
			if hash[:letter] == (letter)
				hash[:hidden] = false
				found = true
			end
		end
		found
	end

	def render
		output = []
		@letters.each do |hash|
			if hash[:hidden] == false
				output.push(hash[:letter])
			else
				output.push("_")
			end
		end
		return output.join
	end

end

binding.pry