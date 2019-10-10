require_relative '../lib/01_dark_trader'

describe "the scrapp_all_crypto_names method" do
    it "should return an array and array is not nil > 2000" do
    expect(scrapp_all_crypto_names(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).is_a?(Array)
    expect(scrapp_all_crypto_names(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
    end
end

describe "the scrapp_all_crypto_prices method" do
    it "should return an array and array is not nil" do
    expect(scrapp_all_crypto_prices(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).is_a?(Array)
    expect(scrapp_all_crypto_prices(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
    end
end

describe "the merge_all_crypto(page) method" do
    it "should return an array with an hash and is not nil" do
    expect(merge_all_crypto(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).is_a?(Array)
    expect(merge_all_crypto(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
    #expect(merge_all_crypto(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).is_a?(Array)
    end
end
