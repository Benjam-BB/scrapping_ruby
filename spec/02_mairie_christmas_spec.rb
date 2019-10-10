require_relative '../lib/02_mairie_christmas'

describe "get_townhall_email method" do
    it "should return an email adress from an url" do
      expect(get_townhall_email(Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/fremainville.html")))).is_a?(String)
    end
   end
   describe "get_townhall_urls method" do
    it "should return an array of all cityhall in Val D'Oise urls " do
      expect(get_townhall_urls(Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")))).not_to be_nil
    end
   end
   describe "perform method" do
    it "should return an array of hashes with cityhall in Val D'Oise names and email adresses as a value" do
      expect(perform).not_to be_nil
    end
   end