class MicroGreens::Scraper
  #for each plant preview (tile) on homepage
  #get tile's data
  #instantiate a Profile based on that data

#HOMEPAGE
  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def homepage #main page with all micro-greens
    doc = html.css("div#search-result-items")
    doc.css("div.o-layout__col").collect do |tile|
      profile = MicroGreens::Profile.new

      profile.name = tile.css("div.c-tile__col a.c-tile__link div.c-tile__name").text.strip
      profile.link = "http://www.johnnyseeds.com/vegetables/micro-greens#{tile.css("a").attribute("href").value.gsub("/vegetables/micro-greens","")}"
      profile.save
      {name: profile.name, link: profile.link} #won't need this hash after revision
    end
  end

  # def list_greens #list of greens in alphabetical order, from homepage
  #   # homepage.sort_by{|hash| hash[:name]}.each.with_index do |hash, index|
  #   #    puts "#{index+1}. #{hash[:name].strip}"
  #   MicroGreens::Profile.all.sort_by{|profile| profile.name}.each.with_index do |profile, index|
  #     puts "#{index+1}. #{profile.name}"
  #   end
  # end

  

# #INDIVIDUAL PROFILE PAGES
#   def new_from_homepage
#     # @new_from_homepage = Nokogiri::HTML(open("#{select(input)[:link]}"))
#     @new_from_homepage = Nokogiri::HTML(open(self.url)
#   end
#
#   def description_one(input)
#     @description_one = new_from_homepage(input).css("p.u-text-size-md").text
#   end
#
#   def description_two(input)
#     @description_two = new_from_homepage(input).css("div.c-content-toggle__content-wrapper").text.strip
#   end
#
#   def maturity(input)
#     @maturity = new_from_homepage(input).css("dd.c-facts__definition")[1].text.strip
#   end
#
#   def grow_info(input)
#     @grow_info = new_from_homepage(input).css("div.c-accordion__body span")[1].text
#   end

end
