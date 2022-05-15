require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Lion", :"Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "Nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
round.end
round.final_score
