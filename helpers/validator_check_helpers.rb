require 'date'

require_relative '../data/constants'
require_relative 'validator_formatting_helpers'

def validation_check(header, value)
  case header
  when 'vrn'
    value.upcase.match?(/^[A-Z]{2}\d{2}\s?[A-Z]{3}/)? Formatters::format_vrn(value) : "VRN: #{value} is an invalid format"

  when 'make'
    (Vehicle::make.include? value.upcase)? Formatters::format_make(value) : "Make: #{value} is an invalid make"

  when 'colour'
    (Vehicle::colour.include? value.capitalize)? Formatters::format_colour(value) : "Colour: #{value} is an invalid colour"

  when 'dateOfManufacture'
    if value.match?(/^(([0-2]?[0-9]?)?(3[0-2])?)[-\/](0[1-9]|1[0-2])[-\/]\d{4}/)
      range_start = Date.parse("01/01/1900")
      date_check = Date.parse(value)
      return ("Date: #{value} is invalid range") unless date_check.between?(range_start, DateTime.now)

      if date_check.month == 2 && date_check.day == 29
        return ("Date: #{date_check} is invalid February date") unless Date.leap?(date_check.year)
      end

      Formatters::format_date(value)
    else
      "Date: #{value} is an invalid format"
    end
  else
    raise "unknown header found: #{header}"
  end
end
