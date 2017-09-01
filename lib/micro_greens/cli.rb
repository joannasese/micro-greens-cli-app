#CLI controller

class MicroGreens::CLI

  def scraper
    @scraper = MicroGreens::Scraper.new
  end

  def call
    puts "Who wants to eat some salad?".colorize(:green)
    puts "Our most popular micro greens are:".colorize(:green)
    scraper.homepage
    list_greens
    menu
    goodbye
  end

  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def list_greens #list of greens in alphabetical order, from homepage
    MicroGreens::Profile.all.each.with_index do |profile, index|
      puts "#{index+1}. #{profile.name}"
    end
  end

  def menu
    puts "Type in the number corresponding to the micro green you would like to learn about.".colorize(:green)
    puts "When you are done learning, type '0' to exit.".colorize(:green)
    input = gets.to_i

    micro_green = MicroGreens::Profile.by_index(input)

    if input <= scraper.homepage.size && input > 0
      puts "Micro Green:".colorize(:green)
      puts micro_green.name

      puts "Description:".colorize(:green)
      puts MicroGreens::Profile.new.description_one(input)
      # puts Nokogiri::HTML(open())

      puts scraper.description_two(input)
      puts "Days to maturity:".colorize(:green)
      puts scraper.maturity(input)
      puts "Growing information:".colorize(:green)
      puts scraper.grow_info(input)

      puts "Would you like to learn even more about this micro green? Type 'Y' or 'N'.".colorize(:green)
      input = gets.chomp.downcase
      if input == "y"
        MicroGreens::Profile.new.open_in_browser
      else
        menu
      end
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
