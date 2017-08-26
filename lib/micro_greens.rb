
module MicroGreens
end

require_relative '../config/environment'

#for testing purposes
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./micro_greens/version"
require_relative './micro_greens/cli'
require_relative './micro_greens/scraper'
