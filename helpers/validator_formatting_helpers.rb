require 'date'

module Formatters

  def self.format_vrn(vrn)
    vrn.upcase!
    vrn.match?(/^\w{4}\s{1}\w{3}/)? vrn : vrn.gsub(/(?<=\d{2})/, ' ')
  end

  def self.format_make(make)
    make.upcase!
    if (make == "VW" || make == "BMW")
      make
    else
      make.capitalize
    end
  end

  def self.format_colour(colour)
    colour.capitalize
  end

  def self.format_date(date)
    Date.parse(date).strftime('%a, %d %B %Y')
  end
end
