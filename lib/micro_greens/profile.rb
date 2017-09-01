class MicroGreens::Profile
  attr_accessor :name, :link, :new_from_homepage, :description_one, :description_two, :maturity, :grow_info
  @@all = Array.new

  # def initialize(name=nil, new_from_homepage=nil)
  #   @name = name
  #   @new_from_homepage = new_from_homepage
  # end
  def self.all
    @@all
  end

  def open_in_browser
    system("open '#{link}'")
  end

  def save
    @@all << self
  end

  #INDIVIDUAL PROFILE PAGES
  def new_from_homepage
    # @new_from_homepage = Nokogiri::HTML(open("#{select(input)[:link]}"))
    @new_from_homepage = Nokogiri::HTML(open(self.url)
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
