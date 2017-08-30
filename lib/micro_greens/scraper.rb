class MicroGreens::Scraper



  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def homepage #main page with all micro-greens
    doc = html.css("div#search-result-items")
    micro_greens_tiles = Array.new
    doc.css("div.o-layout__col").each do |tile|
      name = tile.css("div.c-tile__col a.c-tile__link div.c-tile__name").text
      link = tile.css("a").attribute("href").value.gsub("/vegetables/micro-greens","")
      micro_greens_tiles << {name: name, link: link}
    end
    micro_greens_tiles
  end

  def list_greens
    homepage.sort_by{|hash| hash[:name]}.each.with_index do |hash, index|
       puts "#{index+1}. #{hash[:name].strip}"
    end
  end

  def name(input)
    @name = homepage.sort_by{|hash| hash[:name]}[input-1][:name].strip
  end

  def description
  end


end
