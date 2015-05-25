require_relative 'guess'
require_relative 'game'

	class View

		attr_reader :player
		attr_reader :game

		def initialize
			new_player
			ready_for_play
		end

		def new_player
			p "Представьтесь пожалуйста"
			name = gets.chomp
			if name != ""
				@player = Player.new(name)
			else
				@player = Player.new
			end
		end



		def ask_for_hint
			puts "#{player.name} Хотите использовать подсказку? да/нет"
			answer = gets.chomp
			if answer == "да"
				p @game.take_hint
			end
		end

		def play
			@game = Game.new(@player)
			while @game.attempts < 4
			ask_for_hint if @game.can_use_hint?
				p "попробуйте угадать число"
			guess
			end
		end

	end

View.new