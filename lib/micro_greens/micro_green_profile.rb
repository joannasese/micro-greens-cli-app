class MicroGreens::MicroGreenProfile

  attr_accessor :name, :description, :days_to_maturity, :culture

  @@all = Array.new

  def initialize(name=nil, description=nil, days_to_maturity=nil, culture=nil)
    @name = name
    @description = description
    @days_to_maturity = days_to_maturity
    @culture = culture
    @@all << self
  end

  def self.all
    @@all
  end

  def doc
    @doc = MicroGreens::Scraper.new.html
  end

  def profiles
#NAMES for comparison
# doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.split("\n\n") #array of names
# doc.css("div.c-tile__col a.c-tile__link div").map {|text| text['Text']} #trying to accomplish in other way
#LINKS
# doc.css("div.c-tile__col a.c-tile__link") #gives a large Array
# doc.css("div.c-tile__col a.c-tile__link").first
    extensions = doc.css("div.c-tile__col a").collect {|link| link['href'] }#gives array of links
    extensions.collect do |extension|
      Nokogiri::HTML(open("http://www.johnnyseeds.com#{extension}"))
    end

    # binding.pry

    #individual profile page linked from main page
    # href = doc.css("a.c-tile__link").attribute("href").value
    # link = "http://www.johnnyseeds.com#{href}"
    # @profile = Nokogiri::HTML(open(link))
  end

  def names
    #all micro-green names on main page
    @names = doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.split("\n\n")
  end

  # def name
  #   #individual micro-green
  #   @name = names.collect {|name| name.strip}
  #     # binding.pry
  # end

  def description
    profiles.collect do |profile|
      d1 = profile.css("p.u-text-size-md").text
      d2 = profile.css("div.c-content-toggle__content-wrapper").text.strip
      @description = "#{d1} #{d2}"
    end
    @description
  end
end
