require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
	it "exists" do
		card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
		card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
		deck = Deck.new([card_1, card_2, card_3])
		round = Round.new(deck)

		expect(round).to be_instance_of(Round)
	end

	it "shows deck, turns, and current card" do
		card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
		card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
		deck = Deck.new([card_1, card_2, card_3])
		round = Round.new(deck)

		expect(round.deck).to eq(deck)
		expect(round.turns).to eq([])
		expect(round.current_card).to eq(card_1)
	end

	it "takes a turn" do
		card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
		card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
		deck = Deck.new([card_1, card_2, card_3])
		round = Round.new(deck)
		new_turn = round.take_turn("Juneau")

		expect(new_turn.class).to eq(Turn)
		expect(new_turn.correct?).to eq(true)
		expect(round.current_card).to eq(card_2)
	end

	it "returns number of correct guesses" do
		card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
		card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
		deck = Deck.new([card_1, card_2, card_3])
		round = Round.new(deck)
		new_turn = round.take_turn("Juneau")
		round.take_turn("Venus")


		expect(round.number_correct).to eq(1)
		expect(round.number_correct_by_category(:Geography)).to eq(1)
		expect(round.number_correct_by_category(:STEM)).to eq(0)
	end

	it "returns percent of correct guesses" do
		card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
		card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
		deck = Deck.new([card_1, card_2, card_3])
		round = Round.new(deck)
		new_turn = round.take_turn("Juneau")
		round.take_turn("Venus")

		expect(round.percent_correct).to eq(50.0)
	  expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
	end
end
