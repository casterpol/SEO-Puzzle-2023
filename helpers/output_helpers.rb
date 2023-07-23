require 'csv'

def overview(figures)
  puts "\nOverall Figures:\n"
  figures.each do |line|
    print "#{line.join}\n"
  end
end
def save_to_csv(file_name, valid_data, invalid_data, figures)
  CSV.open(file_name+"_valid_vehicles.csv", 'w') do |line|
    valid_data.each { |object| line << object}
  end

  CSV.open(file_name+"_invalid_vehicles.csv", 'w') do |line|
    invalid_data.each { |object| line << object}
  end

  CSV.open(file_name+"_overall_figures.csv", 'w') do |line|
    figures.each { |object| line << object}
  end

  puts "Files successfully saved"
end

def print_to_terminal(valid_data, invalid_data, figures)
  puts "Valid Vehicles:\n"
  valid_data.each do |line|
    print "#{line}\n"
  end

  puts "\nInvalid Vehicles:\n"
  invalid_data.each do |line|
    print "#{line}\n"
  end

  overview(figures)
end

def overall_figures(valid_arr, invalid_arr, error_tracker)
  headers = 1
  valid_count = valid_arr.count - headers
  invalid_count = invalid_arr.count - headers

  [
    ["Total rows checked: #{valid_count + invalid_count}"],
    ["Total VALID vehicles found: #{valid_count}"],
    ["Total INVALID vehicles found: #{invalid_count}"],
    ["The following is a more granular breakdown of the INVALID vehicles by header:"],
    ["Please be aware some vehicles had more than 1 issue"],
    ["Invalid VRN: #{error_tracker.count('vrn')}"],
    ["Invalid Make: #{error_tracker.count('make')}"],
    ["Invalid Colour: #{error_tracker.count('colour')}"],
    ["Invalid Date of Manufacture: #{error_tracker.count('dateOfManufacture')}"]
  ]
end
