class MicroGreens::MicroGreenProfile

  attr_accessor :name, :url, :description, :days_to_maturity, :culture
  @@all = Array.new

  # def self.assign(micro_green) #assigns name and url
  #   #micro_green = "http://www.johnnyseeds.com/vegetables/micro-greens.css("div#search-result-items div.o-layout__col")
  #   self.new(
  #   @name = micro_green.css("div.c-tile__col a.c-tile__link div.c-tile__name").text, #name
  #   @url = "http://www.johnnyseeds.com#{micro_green.css("a").attribute("href").value}" #link to individual profile ex: /vegetables/micro-greens/collard-vates-micro-green-seed-366MX.html?cgid=micro-greens
  #   )
  # end

  def initialize(name="Hello", url="www.hello.com")
    @name = name
    @url = url
    @@all << self
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end

  def self.all
    @@all
  end

end
