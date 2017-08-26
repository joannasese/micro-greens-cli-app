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
    @doc = MicroGreens::Scraper.html
  end

  def new_from_html(micro_green)
  end

  def name
    @name = doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").first.text.gsub("\n","")
  end

  def description
  end
end
