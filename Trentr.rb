# Trentr - #1 Trenting App in the App store
require 'catpix'
require 'tzinfo'
require 'open_weather'
require 'colorize'
require 'IO/console'

class People
  def initialize(name, origin, description)
    @name = name
    @origin = origin
    @description = description
  end
  attr_accessor :name, :origin, :description
end # END PEOPLE CLASS

class Destination
  def initialize(name, image, place, time)
    @name = name
    @image = image
    @place = place
    @time = time
  end
  attr_accessor :name, :image, :place, :time
end # END DESTINATION CLASS

class Agency
  def initialize(questions, person_list)
    @questions = questions
    @person_list = person_list
  end

  attr_accessor :questions, :person_list

  system('clear')
  5.times do
    print "\u{1f60d} \u{1F618} "
  end
  puts "\n"
  puts 'Welcome to Trentr!'.colorize(:light_red)
  5.times do
    print "\u{1f60d} \u{1F618} "
  end
  puts "\n\n"
  Catpix.print_image 'trentr.jpg',
                     limit_x: 0.7,
                     limit_y: 0.7,
                     center_x: false,
                     center_y: false,
                     bg: nil,
                     bg_fill: false,
                     resolution: 'high'
  puts "\n\n"

  def ask
    puts @questions

    input = STDIN.getch
    case input
    when '1'
      show_info(@person_list[0])
    when '2'
      show_info(@person_list[1])
    when '3'
      show_info(@person_list[2])
    when '4'
      show_info(@person_list[3])
    when '5'
      show_info(@person_list[4])
    end
  end

  def show_image(destination)
    Catpix.print_image destination,
                       limit_x: 0.7,
                       limit_y: 0.7,
                       center_x: false,
                       center_y: false,
                       bg: nil,
                       bg_fill: true,
                       resolution: 'high'
    puts "\n\n"
  end

  def show_time(destination)
    tz = TZInfo::Timezone.get(destination.time)
    tz_string = tz.now.to_s
    puts "    The current time in #{destination.name} is #{tz_string[11..19]}".colorize(:light_red)
  end

  def show_weather(destination)
    options = { units: 'metric', APPID: 'c1ce9d512a69e69adeb90b4a243590a9' }
    data = OpenWeather::Current.city(destination.name.to_s, options)

    puts "    The current temperature is #{data['main']['temp']}, and the weather is #{data['weather'][0]['main']}".colorize(:light_red)
  end

  def show_info(person)
    destination = person.origin
    show_image(destination.image)
    puts "    Meet #{person.name} from #{destination.name}".colorize(:light_red)
    show_time(destination)
    show_weather(destination)
    puts '
      1) Do you like what you see?
      2) See other options
    '
    answer = STDIN.getch

    if answer == '2'
      system 'clear'
      ask
    elsif answer == '1'
      show_image('match.png')
      puts "Congratulations, you've found a match with #{person.name}"
    else
      puts "Error. Please enter 1 or 2"
      sleep 1
      system 'clear'
      ask
    end
  end
end # END AGENCY CLASS

question_list = [
  '   1) Samba your way through the streets, exploring the cuisine and culture before settling down on the beach to watch the sun set with a caipirinha in hand...',
  '   2) Cobblestone streets, espresso and a table for two, followed by an evening stroll along the river...',
  '   3) Hang out at a mutual friend\'s drinking beers before catching the subway to a Hip Hop club...',
  '   4) Go down the local, have a coupla bundies, enter the meat raffle and that\'s pretty much it ay...',
  '   5) An early morning tour of the city\'s historical sites, then some tea and scones, as long as the schedule allows it...'
]

london = Destination.new('London', 'london.png', 'England', 'Europe/London')
paris = Destination.new('Paris', 'paris.jpg', 'France', 'Europe/Paris')
new_york = Destination.new('New York City', 'newyorkcity.jpg', 'The United States', 'America/New_York')
sydney = Destination.new('Sydney', 'sydney.jpg', 'Australia', 'Australia/Sydney')
rio = Destination.new('Rio de Janeiro', 'riodejaneiro.jpg', 'Brazil', 'America/Sao_Paulo')

trenaldo = People.new('Trenaldo', rio, 'Ruby')
trenoir = People.new('Trenoir', paris, 'C')
t_money = People.new('T-Money', new_york, 'Clojure')
trezza = People.new('Trezza', sydney, 'BASIC')
trent_upon_avon = People.new('Trent Upon Avon', london, 'Haskell')

person_list = [
  trenaldo,
  trenoir,
  t_money,
  trezza,
  trent_upon_avon
]

agent = Agency.new(question_list, person_list)
puts 'Hello there, you look lonely, what\'s your name? '.colorize(:light_red)
name = gets.chomp
puts "Great #{name}! Welcome to Trentr, what best describes your perfect date? ".colorize(:light_red)
agent.ask
