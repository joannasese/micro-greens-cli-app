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



#   def profiles #links to individual profile pages
# #NAMES for comparison
# # doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.split("\n\n") #array of names
# # doc.css("div.c-tile__col a.c-tile__link div").map {|text| text['Text']} #trying to accomplish in other way
# #LINKS
# # doc.css("div.c-tile__col a.c-tile__link") #gives a large Array
# # doc.css("div.c-tile__col a.c-tile__link").first
# # doc.css("div.c-tile__col a.c-tile__link").attribute("href").value #gives "/vegetables/micro-greens/collard-vates-micro-green-seed-366MX.html?cgid=micro-greens"
# # doc.css("div.c-tile__col a.c-tile__link href").value
#     extensions = doc.css("div.c-tile__col a").collect {|link| link['href'] }#gives array of links
#     extensions.collect do |extension|
#       Nokogiri::HTML(open("http://www.johnnyseeds.com#{extension}"))
#
#     end
#
#
#     #individual profile page linked from main page
#     # href = doc.css("a.c-tile__link").attribute("href").value
#     # link = "http://www.johnnyseeds.com#{href}"
#     # @profile = Nokogiri::HTML(open(link))
#   end

  # def names
  #   #all micro-green names on main page
  #   @names = doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.split("\n\n")
  #
  # end

  # def name
  #   #individual micro-green
  #   @name = names.collect {|name| name.strip}
  #     # binding.pry
  # end

  # def descriptions
  #   @descriptions = Array.new
  #   profiles.collect do |profile|
  #     d1 = profile.css("p.u-text-size-md").text
  #     d2 = profile.css("div.c-content-toggle__content-wrapper").text.strip
  #     @name = profile.css("div.pt_product-details h1").text
  #     @description = "#{d1} #{d2}"
  #     @descriptions << "#{@name} \n #{@description}"
  #   end
  #   @descriptions
  # end

  # def name
  #   profiles.collect do |profile|
  #     @name = profile.css("div.pt_product-details h1").text
  #   end
  #   @name
  # end

  # def test
  #   @test = Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens/"))
  #   @test.css("div#search-result-items")
  #   @test.css("div#search-result-items div.o-layout__col") #big ass array
  #   @test.css("div#search-result-items div.o-layout__col").css("a").attribute("href").value #individual html link to micro-green profile
  #   #"/vegetables/micro-greens/collard-vates-micro-green-seed-366MX.html?cgid=micro-greens"
  # binding.pry
  # end



end
