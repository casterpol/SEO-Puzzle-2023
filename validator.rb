require 'csv'

require_relative 'helpers/output_helpers'
require_relative 'helpers/validator_check_helpers'
require_relative 'helpers/validator_formatting_helpers'

def validate(file, out_put_method='overview')
  if out_put_method == 'overview'
    puts 'High level overview will be output in the terminal'
  elsif out_put_method == 'save to csv'
    puts 'Please insert the file name / reference you wish to save the file under:'
    save_name = gets.chomp
    puts "The file: #{save_name} will be saved into the results folder.\n3 files will be saved containing valid / invalid / overall figures data"
  elsif out_put_method == 'terminal output'
    puts 'Results will be output in the terminal'
  end

  error_tracker = []
  valid_arr = [['VRN', 'Make', 'Colour', 'Date of Manufacture']]
  invalid_arr = [['VRN', 'Make', 'Colour', 'Date of Manufacture']]

  CSV.foreach(file, headers: true) do |line|
    @seed_array = []
    line.headers.each do |header|
      response = validation_check(header, line[header])
      error_tracker << header if response.include?("invalid")
      @seed_array.push(response)
    end
    @seed_array.index { |e| e.include?("invalid") }.nil? ? valid_arr << @seed_array : invalid_arr << @seed_array
  end

  if out_put_method == 'overview'
    overview(overall_figures(valid_arr, invalid_arr, error_tracker))
  elsif out_put_method == 'save to csv'
    save_to_csv("results/#{save_name}", valid_arr, invalid_arr, overall_figures(valid_arr, invalid_arr, error_tracker))
  elsif out_put_method == 'terminal output'
    print_to_terminal(valid_arr, invalid_arr, overall_figures(valid_arr, invalid_arr, error_tracker))
  end
end

# validate('data/vehicles_data.csv')
validate('data/vehicles_data.csv', 'save to csv')
# validate('data/vehicles_data.csv', 'terminal')
