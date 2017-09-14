class MicroGreens::Green
  attr_accessor :name, :link, :new_from_homepage, :description_one, :description_two, :maturity, :grow_info
  @@all = Array.new

  def initialize
    save
  end

  def self.all
    @@all
  end

  def self.sort_by_name
    self.all.sort_by{|green| green.name}
  end

  def open_in_browser
    system("open '#{link}'")
  end

  def save
    @@all << self
  end

  def self.by_index(index)
    sort_by_name[index]
  end

  #INDIVIDUAL PROFILE PAGES
  def new_from_homepage(green)
    @new_from_homepage = Nokogiri::HTML(open(green.link))
  end

  def description_one(input)
    @description_one = new_from_homepage(input).css("p.u-text-size-md").text
  end

  def description_two(input)
    @description_two = new_from_homepage(input).css("div.c-content-toggle__content-wrapper").text.strip
  end



  def grow_info(input)
    @grow_info = new_from_homepage(input).css("div.c-accordion__body span")[1].text
  end

end
