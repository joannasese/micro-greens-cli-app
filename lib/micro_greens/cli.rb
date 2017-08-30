#CLI controller

class MicroGreens::CLI

  def scraper
    @scraper = MicroGreens::Scraper.new
  end

  # def homepage
  #   @homepage = scraper.homepage
  # end

  def call
    puts "Who wants to eat some salad?".colorize(:green)
    puts "Our most popular micro greens are:".colorize(:green)
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
    # input = gets.strip.downcase
    input = gets.to_i

    if input <= 18 && input > 0
      puts "Micro Green:".colorize(:green)
      puts scraper.name(input)
      # doc = Nokogiri::HTML(open("http://www.johnnyseeds.com#{homepage.sort_by{|hash| hash[:name]}[input-1][:link]}"))
      puts "Description:".colorize(:green)
      # puts doc.css("p.u-text-size-md").text
      puts scraper.description_one(input)
      # puts doc.css("div.c-content-toggle__content-wrapper").text.strip
      puts scraper.description_two(input)
      puts "Days to maturity:".colorize(:green)
      # puts doc.css("dd.c-facts__definition")[1].text.strip
      puts scraper.maturity(input)
      puts "Growing information:".colorize(:green)
      # puts doc.css("div.c-accordion__body span")[1].text
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
