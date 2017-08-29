class MicroGreens::Scraper

  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def homepage #main page with all micro-greens

    doc = html.css("div#search-result-items")
    micro_greens_tiles = Array.new
    doc.css("div.o-layout__col").each do |tile|
    # doc.css("div.c-tile__col").each do |tile|
      name = tile.css("div.c-tile__col a.c-tile__link div.c-tile__name").text
      # name = tile.css("a.c-tile__link div.c-tile__name").text
      link = tile.css("a").attribute("href").value
      # link = tile.css("a.c-tile__link").attribute("href").value
      micro_greens_tiles << {name: name, link: link}
    end
    micro_greens_tiles
  end
  # binding.pry

  # def test
  #   @test = Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens/"))
  #   @test.css("div#search-result-items")
  #   @test.css("div#search-result-items div.o-layout__col") #big ass array
  #   @test.css("div#search-result-items div.o-layout__col").css("a").attribute("href").value #individual html link to micro-green profile
  #   #"/vegetables/micro-greens/collard-vates-micro-green-seed-366MX.html?cgid=micro-greens"
  # binding.pry
  # end


end
