#CLI controller

class MicroGreens::CLI

  def call
    puts "Who wants to eat some salad?"
    puts "Some examples of micro-greens include:"
    list_greens
    menu
    goodbye
  end

  def menu
    input = String.new
    while input != "exit"
      puts "Type in a kind of micro-green you would like to learn about. When you are done learning, type 'exit'."
      input = gets.strip.downcase
      case input
      when "arugula"
        puts "More information on arugula"
      when "radish"
        puts "More information on radish"
      else
        puts "Sorry, we don't have information on that micro-green. Try again."
      end
    end
  end

  def list_greens
    puts <<-DOC
      Arugula
      Marigold
      Radish
    DOC
  end

  def goodbye
    puts "Enjoy your salad!"
  end

end
