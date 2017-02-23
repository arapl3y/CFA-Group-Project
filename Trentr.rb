# Trentr - #1 Trenting App in the App store

require_relative 'Trentr-people'
require_relative 'Trentr-destination'
require_relative 'Trentr-agency'
require 'catpix'
require 'tzinfo'
require 'open_weather'
require 'colorize'
require 'IO/console'

question_list = [
  "1) Samba your way through the streets, exploring the cuisine and culture before settling down on the beach to watch the sun set with a cocktail in hand...",
  "2) Cobblestone streets, espresso and a table for two, followed by an evening stroll along the river...",
  "3) Hang out at a mutual friend\'s drinking beers before catching the subway to a Hip Hop club...",
  "4) Go down the local, have a coupla bundies, enter the meat raffle and that\'s pretty much it ay...",
  "5) An early morning tour of the city\'s historical sites, then some tea and scones, as long as the schedule allows it..."
]

london = Destination.new('London', 'london.png', 'England', 'Europe/London')
paris = Destination.new('Paris', 'paris.jpg', 'France', 'Europe/Paris')
new_york = Destination.new('New York City', 'newyorkcity.jpg', 'The United States', 'America/New_York')
sydney = Destination.new('Sydney', 'sydney.jpg', 'Australia', 'Australia/Sydney')
rio = Destination.new('Rio de Janeiro', 'riodejaneiro.jpg', 'Brazil', 'America/Sao_Paulo')

trenaldo = People.new('Trenaldo', rio, "Trenaldo is fun, easy-going and active, loves beach soccer and going for runs. His favourite programming language is Ruby.")
trenoir = People.new('Trenoir', paris, "Trenoir is sophisticated, sharp, and a little pompous, he loves the classics and continues to program in C.")
t_money = People.new('T-Money', new_york, "T-Money is funny, stylish and talented, however a few too many nights out have left him unhinged, he codes in JavaScript.")
trezza = People.new('Trezza', sydney, "Trezza\'s a simple bloke, love\'s his mates and sport, never really needed a computer ay...")
trent_upon_avon = People.new('Trent Upon Avon', london, "Trent Upon Avon is a traditional gentleman and gifted Mathematician, he only writes in Haskell.")

person_list = [
  trenaldo,
  trenoir,
  t_money,
  trezza,
  trent_upon_avon
]

agent = Agency.new(question_list, person_list)
puts "You look lonely, what\'s your name? ".colorize(:light_red)
name = gets.chomp
sleep 0.5
puts "Great #{name}! Welcome to Trentr, which best describes your perfect date? ".colorize(:light_red)
agent.ask
