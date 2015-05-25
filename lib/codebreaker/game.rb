#require_relative 'guess'

module Codebreaker
CODE_LENGTH = 4
	class Game<Guess
		attr_accessor :code, :guess_code
		attr_reader :answer

		def initialize
			@code = ""
			CODE_LENGTH.times {@code << "#{rand(1..6)}"}
			@guess_code = ""
			@answer = []
		end

		def valid?
			if @code =~ /^[1-6]{#{CODE_LENGTH}}$/
				true
			else
				false
			end
		end


		def guess(guess_code)
			guess = Codebreaker::Guess.new(guess_code)
			if guess.valid?
				@guess_code = guess_code
			else
				raise "Your code must contain 4 numbers in range from 1 to 6!"
			end
		end


		def compare
			code = []
			guess_code = []
			@answer = []
			i = 0
			CODE_LENGTH.times do
				code << @code[i].to_i
				guess_code << @guess_code[i].to_i
				i+=1
			end
			i = 0
			CODE_LENGTH.times do
				if code.include? guess_code[i]
					if code[i] == guess_code[i]
						@answer << "+"
					else
						@answer << "-"
					end
				end
				i+=1
			end
			@answer
		end



		def give_hint
			@code[rand(0..CODE_LENGTH-1)]
		end
	end
end


test = Codebreaker::Game.new
test.code = '6521'

p test
p test.guess('6125')
p test.valid?
p test.compare
p test.code
p test.give_hint