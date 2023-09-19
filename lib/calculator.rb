require_relative "./data_builder"

# Calculator class performs the calculation and owns the rules around which rates to choose
# Depends on the DataBuilder to organize the data into queryable hashes
class Calculator
  SLCSP_CSV_PATH = "./spec/fixtures/slcsp.csv"

  def initialize
    @slcsp_rates = {}
  end

  def slcsp_rates_hash
    data_builder = DataBuilder.new
    build_slcsp_rates(data_builder.zips)
    slcsp_rates
  end

  private

  attr_reader :slcsp_rates

  def build_slcsp_rates(zips)
    CSV.foreach(SLCSP_CSV_PATH, headers: true) do |row|
      zipcode = row['zipcode']

      rates = zips[zipcode]
      slcsp_rate =
        if rates && rates.length < 2
          rates[0].uniq.sort[1]
        end

      slcsp_rates[zipcode] = slcsp_rate
    end
  end
end
