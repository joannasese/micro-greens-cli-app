#CLI controller

class MicroGreens::CLI

  def homepage
    @homepage = MicroGreens::Scraper.new.homepage
  end

  def call
    puts "Who wants to eat some salad?".colorize(:green)
    puts "Our most popular micro greens are:".colorize(:green)
    list_greens
    menu
    goodbye
  end

  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def list_greens
    homepage.sort_by{|hash| hash[:name]}.each.with_index do |hash, index|
       puts "#{index+1}. #{hash[:name].strip}"
    end
  end

  def menu
    puts "Type in a kind of micro-green you would like to learn about. When you are done learning, type '0' to exit.".colorize(:green)
    # input = gets.strip.downcase
    input = gets.to_i

    if input <= 18 && input > 0
      puts "Micro Green:".colorize(:green)
      puts homepage.sort_by{|hash| hash[:name]}[input-1][:name].strip
      doc = Nokogiri::HTML(open("http://www.johnnyseeds.com#{homepage.sort_by{|hash| hash[:name]}[input-1][:link]}"))
      puts "Description:".colorize(:green)
      puts doc.css("p.u-text-size-md").text
      puts doc.css("div.c-content-toggle__content-wrapper").text.strip
      puts "Days to maturity:".colorize(:green)
      puts doc.css("dd.c-facts__definition")[1].text.strip
      puts "Growing information:".colorize(:green)
      puts doc.css("div.c-accordion__body span")[1].text
    elsif input == 0
    else
      puts "Sorry, we do not have information about that micro-green. Do try again!".colorize(:green)
      menu
    end

  end

  def goodbye
    puts "Enjoy your salad!".colorize(:green)
  end

end
