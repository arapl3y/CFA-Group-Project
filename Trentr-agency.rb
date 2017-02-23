
require 'catpix'
require 'tzinfo'
require 'open_weather'
require 'colorize'
require 'IO/console'

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
    puts "    The current time in #{destination.name} is #{tz_string[11..19]}- also known as love o' clock and".colorize(:light_red)
  end

  def show_weather(destination)
    options = { units: 'metric', APPID: 'c1ce9d512a69e69adeb90b4a243590a9' }
    data = OpenWeather::Current.city(destination.name.to_s, options)
    puts "    it's #{data['main']['temp']} degrees, with a forecast of #{data['weather'][0]['main']}, perfect for your first date!".colorize(:light_red)
  end

  def show_info(person)
    destination = person.origin
    show_image(destination.image)
    puts "    Meet #{person.name} from #{destination.name}, ".colorize(:light_red)
    puts person.description.colorize(:light_red)
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
      puts "    Congratulations, you've found a match with #{person.name}!".colorize(:light_red)
    else
      puts "Error. Please enter 1 or 2"
      sleep 1
      system 'clear'
      ask
    end
  end
end
