#CLI controller

class MicroGreens::CLI

  def scraper
    @scraper = MicroGreens::Scraper.new
  end

  def call
    puts "Who wants to eat some salad?".colorize(:green)
    puts "Our most popular micro greens are:".colorize(:green)
    scraper.homepage
    scraper.list_greens
    menu
    goodbye
  end

  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def menu
    puts "Type in the number corresponding to the micro green you would like to learn about.".colorize(:green)
    puts "When you are done learning, type '0' to exit.".colorize(:green)
    input = gets.to_i

    if input <= scraper.homepage.size && input > 0
      puts "Micro Green:".colorize(:green)
      puts scraper.name(input)
      puts "Description:".colorize(:green)
      puts scraper.description_one(input)
      puts scraper.description_two(input)
      puts "Days to maturity:".colorize(:green)
      puts scraper.maturity(input)
      puts "Growing information:".colorize(:green)
      puts scraper.grow_info(input)
      menu
    elsif input == 0
    else
      puts "Sorry, we do not have information about that micro green. Do try again!".colorize(:green)
      menu
    end
  end

  def goodbye
    puts "Enjoy your salad!".colorize(:green)
  end

end
