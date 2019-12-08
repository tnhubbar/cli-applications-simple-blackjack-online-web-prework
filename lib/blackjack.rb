# Here's how we want our game to run:

# 1. Welcome the user
# 2. Deal them their first two cards, i.e. their `initial_round`
# 3. Ask them if they want to hit or stay
# 4. If they want to stay, ask them again!
# 5. If they want to hit, deal another card and display the new total
# 6. If their card total exceeds 21, the game ends.

# Use a loop constructor (I'd recommend `until`, but that is by no means your only
# option) to enact the above gameplay in the `runner` method. Then, check out the
# `lib/runner.rb` file. Notice that it is simply calling the `runner` method. The
# runner file will call the `runner` method which should, in turn, utilize all the
# other methods you built!



##################
# shared methods #
##################

def welcome
  # code #welcome here
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end


##########
# rounds #
##########

def welcome
  puts "Welcome to the Blackjack Table"
end


def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end


def initial_round
  first_round = deal_card + deal_card
  display_card_total(first_round)
  return first_round
end

def get_user_input
  gets.chomp.strip
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end



def hit?(card_total)
  valid_inputs = ["h", "s"]

  prompt_user
  user_input = get_user_input

  until valid_inputs.include?(user_input)
    invalid_command
    prompt_user
    user_input = get_user_input
  end

  if user_input == "h"
    card_total += deal_card
  end
  card_total
  
  ## Alternative solution - this solution calls hit? recursively if given an invalid command
  # if user_input == "h"
  #   card_total += deal_card
  # elsif user_input == "s"
  #   card_total
  # else
  #   invalid_command
  #   hit?(card_total)
  # end
  
end

def invalid_command
  puts "Please enter a valid command"
end

##########
# runner #
##########

def runner
  welcome
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end
    
