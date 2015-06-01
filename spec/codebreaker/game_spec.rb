require '../spec_helper'

module Codebreaker
		describe Game do
			context "initially" do
				it "should generate code" do
					expect(subject.code).to_not be_empty
				end

				it "should generate a code with 4 numbers" do
					expect(subject.code.size).to eq(4)
				end

				it "4 differnt numbers in 1..6" do
					expect(subject.code).to match(/^[1-6]{4}$/)
				end
			end

			context "valid" do
				it "correct data and return true" do
					subject.code = "1234"
					expect(subject).to be_valid
				end

				it "wrong data and return false" do
					subject.code = "12382"
					expect(subject).to_not be_valid
				end
			end

			context "guess" do


			it "raise error for invalid guess code" do
					invalid_code = "12568"
					expect {subject.guess(invalid_code)}.to raise_error
				end
			end

			context "hint" do
				it "should return a number from 1 to 6" do
					expect(subject.give_hint).to match(/^[1-6]$/)
				end

				it "should reveal one random number of initial code" do
					subject.code = "1234"
					expect(subject.give_hint).to match(/^[1234]$/)
				end
			end

			context "compare" do
			before {subject.code = "1234"}
				it "should fail if no match found" do
					subject.guess_code = "5555"
					expect(subject.compare).to eq([])
				end

			it "should mark with '-'" do
				subject.guess_code = "5155"
				expect(subject.compare).to eq(["-"])
			end

			it "should mark with 2 '-'" do
				subject.guess_code = "5145"
				expect(subject.compare).to eq(["-","-"])
			end


			it "should mark with 3 '-'" do
				subject.guess_code = "2146"
				expect(subject.compare).to eq(["-","-","-"])
			end

			it "should mark with 4 '-'" do
				subject.guess_code = "2143"
				expect(subject.compare).to eq(["-","-","-","-"])
			end

			it "should mark with '+'" do
				subject.guess_code = "5255"
				expect(subject.compare).to eq(["+"])
			end

			it "should mark with 2 '+'" do
				subject.guess_code = "1266"
				expect(subject.compare).to eq(["+","+"])
			end

			it "should mark with 3 '+'" do
				subject.guess_code = "1236"
				expect(subject.compare).to eq(["+","+","+"])
			end

			it "should mark with both '+' and '-'" do
				subject.guess_code = "1525"
				expect(subject.compare).to eq(["+","-"])
			end

			it "should mark with both '+' and 2 '-'" do
				subject.guess_code = "1523"
				expect(subject.compare).to eq(["+","-","-"])
			end

			it "should mark with both '+' and 3 '-'" do
				subject.guess_code = "1423"
				expect(subject.compare).to eq(["+","-","-","-"])
			end

			it "should mark with 2 '+' and '-'" do
				subject.guess_code = "1246"
				expect(subject.compare).to eq(["+","+","-"])
			end

			it "should mark with 2 '+' and 2 '-'" do
				subject.guess_code = "1243"
				expect(subject.compare).to eq(["+","+","-","-"])
			end

		end
	end
end
			

