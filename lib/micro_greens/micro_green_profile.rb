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

  def profile
    #individual profile page linked from main page
    href = doc.css("a.c-tile__link").attribute("href").value
    link = "http://www.johnnyseeds.com#{href}"
    @profile = Nokogiri::HTML(open(link))
  end

  def names
    #all micro-green names on main page
    @names = doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.split("\n\n")
  end

  def name
    #individual micro-green
    @name = names.collect {|name| name.strip}
      # binding.pry
  end

  def description
    d1 = profile.css("p.u-text-size-md").text
    d2 = profile.css("div.c-content-toggle__content-wrapper").text.strip
    @description = "#{d1} #{d2}"

  end
end
