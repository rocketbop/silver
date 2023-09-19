require "csv"
require "pry-byebug"
require_relative "../lib/calculator"

RSpec.describe Calculator do
  describe "#slcsp_rates" do
    subject(:rates) { described_class.new.slcsp_rates_hash }

    before do
      allow(DataBuilder).to receive(:new).and_return(data_builder)
      allow(data_builder).to receive(:zips).and_return(zips)
    end

    let(:data_builder) { instance_double(DataBuilder) }
    let(:zips) do
      {
        "64148" => [["111.11", "222.22"]]
      }
    end

    it "returns a hash" do
      expect(rates).to be_a(Hash)
    end

    it "chooses the second cheapest rate for a given zipcode" do
      expect(rates["64148"]).to eq("222.22")
    end

    context "when there are multiple items of the same value" do
      let(:zips) do
        {
          "64148" => [["111.11", "111.11", "222.22"]]
        }
      end

      it "chooses the second cheapest rate by excluding the duplicates" do
        expect(rates["64148"]).to eq("222.22")
      end
    end

    context "when there is only one rate for a zipcode" do
      let(:zips) do
        {
          "64148" => [["111.11"]]
        }
      end

      it "does not return a rate as it can not be the second cheapest" do
        expect(rates["64148"]).to eq(nil)
      end
    end
    context "when the zips struct contains multiple rate entries because the zipcode occurs in more than one rate area" do
      let(:zips) do
        {
          "64148" => [["111.11", "222.22"], ["333.33"]]
        }
      end

      it "a rate is not chosen for that row" do
        expect(rates["64148"]).to eq(nil)
      end
    end
  end
end
