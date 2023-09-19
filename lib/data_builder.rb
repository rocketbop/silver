class DataBuilder
  ZIPS_CSV_PATH = "./spec/fixtures/zips.csv"
  PLANS_CSV_PATH = "./spec/fixtures/plans.csv"

  def initialize
    @plans_hash = Hash.new { |hash, key| hash[key] = [] }
    @zips_hash = Hash.new { |hash, key| hash[key] = [] }
    build_silver_plans_hash
    build_zips_hash
  end

  def plans
    @plans_hash
  end

  def zips
    @zips_hash
  end

  private

  attr_reader :zips_hash, :plans_hash

  def build_silver_plans_hash
    CSV.foreach(PLANS_CSV_PATH, headers: true) do |row|
      state = row["state"]
      rate = row["rate"]
      rate_area = row["rate_area"]
      metal_level = row["metal_level"]

      plans_hash["#{state}_#{rate_area}"] << rate if metal_level == "Silver"
    end
  end

  def build_zips_hash
    CSV.foreach(ZIPS_CSV_PATH, headers: true) do |row|
      state = row["state"]
      rate_area = row["rate_area"]
      zipcode = row["zipcode"]
      rates = plans_hash["#{state}_#{rate_area}"]

      zips_hash[zipcode].push(rates)
    end
  end

end
