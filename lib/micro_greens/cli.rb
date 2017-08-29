#CLI controller

class MicroGreens::CLI

  def homepage
    @homepage = MicroGreens::Scraper.new.homepage
  end

  def call
    puts "Who wants to eat some salad?".colorize(:green)
    puts "Our selection of micro-greens includes:".colorize(:green)
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
    input = String.new
    puts "Type in a kind of micro-green you would like to learn about. When you are done learning, type 'exit'.".colorize(:green)
    input = gets.strip.downcase

    homepage.each do |hash|
      if hash[:name].downcase.include?(input)
        doc = Nokogiri::HTML(open("http://www.johnnyseeds.com#{hash[:link]}"))
        puts hash[:name]
        puts doc.css("p.u-text-size-md").text
        puts doc.css("div.c-content-toggle__content-wrapper").text.strip
        puts "profile page days to maturity"
        puts "culture"
        menu
      elsif input == "exit"
      else
        puts "Sorry, we do not have information about that micro-green. Do try again!".colorize(:green)
        menu
      end
    end

  end




  def goodbye
    puts "Enjoy your salad!".colorize(:green)
  end

end
