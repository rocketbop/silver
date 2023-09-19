require "pry"
require "csv"
require_relative "./calculator.rb"

class Processor
  # @example { "12345" => 14.0 }
  #
  # @return [Hash] the hash of zipcode to rate
  def self.calculate_slcsp_rates_hash
    Calculator.new.slcsp_rates_hash
  end

  # Writes to an output file the calculated rates
  #
  # Outputs to a file called `updated_slcsp.csv`
  # @return [Boolean] true if finishes without error
  #
  def self.write_slcsp_rates_file()
    slcsp_rates = calculate_slcsp_rates_hash

    CSV.open('updated_slcsp.csv', 'w') do |csv|
      csv << ['zipcode', 'rate']

      slcsp_rates.each do |zipcode, rate|
        csv << [zipcode, rate] # Write each row of data
      end
    end

    true
  end
end
