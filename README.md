# SEO-Puzzle-2023

### The main file in this repo is "validator.rb"
This file is the main entry point and allows a user to pass in a csv file, and allows 3 different out options.
The default output option is overview, this will only return high level figures back to the user.

### There are support folders called:
data
contains the vehicles_data.csv file (main data set) and also constants.rb which contains relevant requirements
for the correct validation of the file.

helpers
output_helpers: This file contains methods related to the 3 different output options available
validator_check_helpers: This contains one method that validates the data
validator_formatting_helper: This file contains the different formatters required to correctly format the output data

### How to run
I have left 3 commented out lines at the bottom of the validator.rb file. simply uncomment one of them, open up the IDE terminal
and type in:
```
ruby Validator.rb
```

### Output options
overview: this will only return high level figures back to the user.
save to csv: this will prompt you for a file name, then create 3 output files, one containing valid vehicles, one containing invalid vehicles
and the third will contain the high level data
terminal output: this option will output all data to the terminal

#### Results folder
The results folder has been left empty, however, if you choose the option to save to csv, this is where the files will be saved



### Rspec Tests
I wrote a few very basic rspec tests when building my formatters to ensure the formatters worked as required.

#### Rpsec tests can be run from within the terminal using
```
bundle exec rspec
```
