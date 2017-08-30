class MicroGreens::Scraper
  attr_accessor :name, :new_from_homepage, :description_one, :description_two, :maturity, :grow_info

  def initialize(name=nil)
    @name = name
  end

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

  def list_greens #list of greens in alphabetical order, from homepage
    homepage.sort_by{|hash| hash[:name]}.each.with_index do |hash, index|
       puts "#{index+1}. #{hash[:name].strip}"
    end
  end

  def name(input)
    @name = homepage.sort_by{|hash| hash[:name]}[input-1][:name].strip
  end

  def new_from_homepage(input)
    @new_from_homepage = Nokogiri::HTML(open("http://www.johnnyseeds.com#{homepage.sort_by{|hash| hash[:name]}[input-1][:link]}"))
  end

  def description_one(input)
    @description_one = new_from_homepage(input).css("p.u-text-size-md").text
  end

  def description_two(input)
    @description_two = new_from_homepage(input).css("div.c-content-toggle__content-wrapper").text.strip
  end

  def maturity(input)
    @maturity = new_from_homepage(input).css("dd.c-facts__definition")[1].text.strip
  end

  def grow_info(input)
    @grow_info = new_from_homepage(input).css("div.c-accordion__body span")[1].text
  end

end
