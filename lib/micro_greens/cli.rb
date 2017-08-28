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
    # binding.pry

      puts "Type in a kind of micro-green you would like to learn about. When you are done learning, type 'exit'.".colorize(:green)
      input = gets.strip.downcase

      if MicroGreens::MicroGreenProfile.new.names.detect {|name| name.downcase.include?(input)}
        puts ""
        puts MicroGreens::MicroGreenProfile.new.names.select {|name| name.downcase.include?(input)}
        #above returns all names that match input
        puts ""

        puts "Name of individual microgreen"
        MicroGreens::MicroGreenProfile.new.names.collect do |name|
          if name.downcase.include?(input)
            puts name
            puts MicroGreens::MicroGreenProfile.new.description
          end
        end
        puts ""
        
        menu
      elsif input == "exit"
        # goodbye
      else
        puts "Sorry"
        menu
      end

      # MicroGreens::MicroGreenProfile.new.names.each do |name|
      #   if name.downcase.strip.include?(input)
      #     puts name
      #     puts "Description: #{MicroGreens::MicroGreenProfile.new.description}"
      #   else
      #     puts "Sorry, we do not have information about that micro-green."
      #   end
      # end

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
