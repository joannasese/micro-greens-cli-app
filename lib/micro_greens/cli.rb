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
      puts "Type in a kind of micro-green you would like to learn about. When you are done learning, type 'exit'.".colorize(:green)
      input = gets.strip.downcase

      MicroGreens::MicroGreenProfile.new.names.each do |name|
        if name.downcase.strip.include?(input)
          puts name
          puts "Description: #{MicroGreens::MicroGreenProfile.new.description}"
        else
          puts "Sorry, we do not have information about that micro-green."
        end
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
    puts "Enjoy your salad!".colorize(:green)
  end

end
