class Deck
  attr_reader :cards

  def initialize
      reset
  end

  def shuffle
      @cards.shuffle!
  end

  def deal(number)
      @cards.pop(number)
  end

  def reset #♥♠♣♦♤♧♡♢
      @cards = [ ]
      ["◇", "♡", "♣", "♠"].each do |suit|
        ["A", 2,3,4,5,6,7,8,9,10,"J","Q","K"].each do |val|
          @cards << [suit, val]
        end
      end
  end

end

class Player
  attr_reader :hand
  attr_accessor :name

  def initialize name
      @name = name
      @hand = []
  end

  def draw deck, number
      deck.deal(number).each{|card| @hand << card }
  end

  def discard cards
      @hand.delete_at(cards)
  end
end

# player1 = Player.new("Tom")
# player1.draw(deck, 5)
# p player1.hand
# player1.discard 3
# p player1.hand


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# -------------------GAME START------------------------
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#helper function, prints an array of cards (hand) so it looks pretty in the terminal
def pretty_print hand 
	hand.each do |card|
		print "[#{card.join}] "
	end
	print "#{add_hand hand}\n"
end

#helper method, adds up a hand's value
def add_hand hand 	
	sum = 0
	num_aces = 0
	hand.each do |suit, value| 
		sum += value unless value.class == "".class
		sum += 10 if ["K","Q","J"].include?(value)
		num_aces+=1 if value == "A"
		# p "num aces#{num_aces}"
		# p "sum#{sum}"
	end
	num_aces.times do |i|
		if (sum + 11) < 21
			# p "case 1"
			sum += 11
		elsif (sum + 11) == 21 and i+1 == num_aces #only if its the last ace
			# p "case 2"
			sum += 11
		else
			# p "case 3"
			sum += 1
		end
		# p "sum: #{sum}"
	end
	sum
end

system "clear" or system "cls" #tries to clear the terminal 2 different ways

#create and shuffle the deck
deck = Deck.new
deck.shuffle

#make the player and dealer
print "enter a name: "
name = gets.chomp		#waits for user input, stores it in name, chomp cuts off trailing whitespace
player1 = Player.new(name)
puts "Welcome to the table, #{player1.name}"
dealer = Player.new("Dealer")

#dealer and player draw 2 cards from the deck. print the players hand
player1.draw deck, 2
dealer.draw deck, 2
pretty_print player1.hand

#wait for user input
print "hit or stand? "
move = gets.chomp 	

#while the user enters "hit" draw a card, print the new hand, wait for input
while move == "hit" do
	player1.draw deck, 1 if move == "hit" #note add a check to see if they are now over 21 at this point?...
	pretty_print player1.hand

	print "hit or stand? "
	move = gets.chomp
end

#add up the resulting hands
player_sum = add_hand player1.hand
dealer_sum = add_hand dealer.hand

#dealer draws until over 17
while dealer_sum <17 do
	dealer.draw deck, 1
	dealer_sum = add_hand dealer.hand
end
sleep(0.5)	#pauses the terminal for 0.5 seconds

print "Dealers Hand: "
pretty_print dealer.hand
sleep(0.5)

print "Player's Hand: "
pretty_print player1.hand

# commented out because the totals are now printed with "pretty_print"
# sleep(0.5)
# puts "your total: #{player_sum}"
# sleep(0.5)
# puts "dealer total: #{dealer_sum}"

#win lose logic
sleep(1)
if player_sum > 21
	puts "Over 21! You lose!"
elsif dealer_sum >21
	puts "Dealer bust! You win!"
elsif player_sum > dealer_sum
	puts "less than 21, more than the dealer, You Win!"
elsif player_sum == dealer_sum
	puts "Draw!"
else
	puts "dealer is more than you, You Lose!"
end
sleep(1)

#ask to play again?  
  
  #add the values, of player1
  #add the values of the dealer
  #if player over 21 they lose
  #elsif player > dealer they win
  #elsif player == dealer draw
  #else they lose
