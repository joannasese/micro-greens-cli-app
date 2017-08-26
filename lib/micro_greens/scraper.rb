class MicroGreens::Scraper

  def html
    doc = Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
    binding.pry
  end

  def scrape_micro_greens
    name = doc.css("div.c-tile__col a.c-tile__link div.c-tile__name").first.text.gsub("\n","")
  end

  def micro_greens
    scrape_micro_greens.each do |micro_green|
      MicroGreens::MicroGreenProfile.new_from_html(micro_green)
    end
  end
end
