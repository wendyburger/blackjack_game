# suits = [S, C, H, D]

# 1. dealer_points
# 2. player_points
# 3. delaer_points
# 4. player_points

# 5. calculate the sum of cards
#   player choose hit or stay
#   if stay 
#     save the value of cards, compare with dealer
#   else hit
#     if sum > 21
#       player lose
#     elsif sum = 21
#       player win
#     else
#       player choose agin 

# 6. calculate the sum of cards
#   if sum > 17
#     dealer stay
#   else dealer hit
#     if sum > 21
#       player win
#     elsif sum = 21
#       dealer win

def calculate_total_point(cards) #[['H', Q], ['S', 3]...]
  arr = cards.map {|a| a[1]}  
  total = 0
  arr.each do |num|
    if num == "A"
      total += 11
    elsif num.to_i == 0
      total += 10
    else 
      total += num.to_i
     end
   end

  #Modify Ace  
  arr.select {|e| e == "A"}.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end



# Start Game
puts "Welcome to blackjack game!"

# Deal cards
suits = ["S", "C", "H", "D"]
cards_numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
deck = suits.product(cards_numbers)
deck.shuffle!

dealer_cards = []
player_cards = []

dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop

dealer_sum = calculate_total_point(dealer_cards)
p dealer_sum
player_sum = calculate_total_point(player_cards)
p player_sum


# Show cards
puts "Dealer has: #{dealer_cards[0]}, #{dealer_cards[1]}, Total points: #{dealer_sum}"
puts "Player has: #{player_cards[0]}, #{player_cards[1]}, Total points: #{player_sum}"

# Player choose hit or stay
begin
puts "What do you want to do? 1)Hit 2)Stay :"
hit_or_stay = gets.chomp

  if hit_or_stay == '2'
    puts "Your total points: #{player_sum}"
  elsif hit_or_stay == '1'
    player_cards << deck.pop
    new_card = player_cards
    puts "You dealer to play #{new_card}"
    player_sum = calculate_total_point(player_cards)
    puts "Your Total points: #{player_sum}"
  end

end until player_sum >= 21 || hit_or_stay == '2'

if player_sum == 21
  puts "Congratulation! You hit the blackjack. You win!"
  exit
elsif player_sum > 21
  puts "Sorry, you busted! You lose!"
  exit
end

# Dealer choose hit or stay
begin

if dealer_sum < 17
  dealer_cards << deck.pop
  new_card = dealer_cards
  puts "dealer to play #{new_card}"
  dealer_sum = calculate_total_point(dealer_cards)
  puts "Dealer's total point: #{dealer_sum}"
end
end until dealer_sum > 17

if dealer_sum == 21
  puts "Sorry, Dealer hit the blackjack. You lose!"
  exit
elsif dealer_sum > 21
  puts "Dealer busted! You Win!"
  exit
end



# Compare the total point, and winner
if player_sum > dealer_sum && player_sum <= 21
  puts "Your total points: #{player_sum}, Dealer's total point: #{dealer_sum}"
  puts "You win!"
elsif player_sum < dealer_sum && dealer_sum <= 21
  puts "Your total points: #{player_sum}, Dealer's total point: #{dealer_sum}"
  puts "You lose!"
else 
  puts "Your total points: #{player_sum}, Dealer's total point: #{dealer_sum}"
  puts "It's tie"
end











    



      