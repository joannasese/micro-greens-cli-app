class MicroGreens::Scraper

  def html
    Nokogiri::HTML(open("http://www.johnnyseeds.com/vegetables/micro-greens"))
  end

  def scrape_micro_greens
    self.html.css("div.c-tile__name product-name")
  end

  def micro_greens
    scrape_micro_greens.each do |micro_green|
      MicroGreens::MicroGreenProfile.new_from_html(micro_green)
    end
  end
end
