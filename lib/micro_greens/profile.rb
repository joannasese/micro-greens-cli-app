class MicroGreens::Profile
  attr_accessor :name, :new_from_homepage, :description_one, :description_two, :maturity, :grow_info

  def initialize(name=nil, new_from_homepage=nil)
    @name = name
    @new_from_homepage = new_from_homepage
  end
end
