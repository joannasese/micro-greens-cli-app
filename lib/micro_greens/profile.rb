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

  def save
    @@all << self
  end
end
