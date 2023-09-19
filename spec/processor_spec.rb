# frozen_string_literal: true

require "spec_helper"
require_relative "../lib/processor"

RSpec.describe Processor do
  describe ".calculate_slcsp_rates_hash" do
    let(:expected_output) { expected_slcsp_output_hash }

    it "returns the expected hash" do
      expect(Processor.calculate_slcsp_rates_hash).to eq(expected_output)
    end
  end

  # I put in the real results from the real test files rather than using
  # custom fixtures due to time constrains, as I don't have time to work
  # out a good set of inputs other than the ones provided.
  def expected_slcsp_output_hash
    {
      "64148" => "245.2",
      "67118" => nil,
      "40813" => nil,
      "18229" => "231.48",
      "51012" => "252.76",
      "79168" => "243.68",
      "54923" => nil,
      "67651" => nil,
      "49448" => nil,
      "27702" => "283.08",
      "47387" => nil,
      "50014" => nil,
      "33608" => "268.49",
      "06239" => nil,
      "54919" => "243.77",
      "46706" => nil,
      "14846" => nil,
      "48872" => nil,
      "43343" => nil,
      "77052" => "243.72",
      "07734" => nil,
      "95327" => nil,
      "12961" => nil,
      "26716" => nil,
      "48435" => nil,
      "53181" => "306.56",
      "52654" => nil,
      "58703" => "297.93",
      "91945" => nil,
      "52146" => "254.56",
      "56097" => nil,
      "21777" => nil,
      "42330" => nil,
      "38849" => nil,
      "77586" => "243.72",
      "39745" => nil,
      "03299" => "240.45",
      "63359" => nil,
      "60094" => "209.95",
      "15935" => "184.97",
      "39845" => nil,
      "48418" => nil,
      "28411" => nil,
      "37333" => "219.29",
      "75939" => nil,
      "07184" => nil,
      "86313" => "292.9",
      "61232" => "222.38",
      "20047" => nil,
      "47452" => nil,
      "31551" => nil
    }
  end
end
