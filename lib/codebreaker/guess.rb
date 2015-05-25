module Codebreaker
	class Guess
		attr_accessor :code

		def initialize(code = nil)
			@code = code
		end


		def valid?
			if @code =~ /^[1-6]{#{CODE_LENGTH}}$/
				true
			else
				false
			end
		end
	end
end