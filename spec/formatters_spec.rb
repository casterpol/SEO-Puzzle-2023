require_relative '../helpers/validator_formatting_helpers'

describe Formatters do

  describe "format_vrn" do
    it "returns valid vrn format" do
      expect(Formatters::format_vrn("pp86 wUd")).to eq("PP86 WUD")
    end
  end

  describe "format_make" do
    it "returns valid make format" do
      expect(Formatters::format_make("bMw")).to eq("BMW")
      expect(Formatters::format_make("MeRcEdEs")).to eq("Mercedes")
    end
  end

  describe "format_colour" do
      it "returns valid colour format" do
        expect(Formatters::format_colour("wHiTe")).to eq("White")
      end
  end

  describe "format_date" do
    it "returns valid date format" do
      expect(Formatters::format_date("01/07/2023")).to eq("Sat, 01 July 2023")
    end
  end

end