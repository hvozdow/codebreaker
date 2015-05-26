require_relative 'game'

	class Play

		attr_reader :game
		attr_reader :answer

		def initialize
			@guess_code = ""
			@answer = []
		end
		

		def play
			game = Codebreaker::Game.new
			game.guess
			p game.compare
			while game.compare != ["+","+","+","+"] do
				p "Guess the number"
				game.guess
				p game.compare
				p "Do you need help? Y/N"
				yesno = gets.chomp
				if yesno.capitalize =='Y'
					p game.give_hint
				end
			end
			p 'You Win'
		end

	end

 #test = Play.new

 #test.play
