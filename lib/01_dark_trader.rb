require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def scrapp_all_crypto_names(page)
    all_crypto_names = page.xpath('//tr/td[3]/text()')
    all_crypto_names = all_crypto_names.map {|name| name.to_s}
    return all_crypto_names
end

def scrapp_all_crypto_prices(page)
    all_crypto_prices = page.xpath('//tr/td[5]/a/text()')
    all_crypto_prices = all_crypto_prices.map { |price| price.to_s.delete("$").to_f} #pour supprimer le dollar
return all_crypto_prices
end

def merge_all_crypto(page)
    all_crypto_names = scrapp_all_crypto_names(page) 
    all_crypto_prices = scrapp_all_crypto_prices(page)
    all_crypto = []
    for i in 0...all_crypto_names.size #trois points pour strictement inférieur, deux points pour inférieur ou égal
        all_crypto << {all_crypto_names[i] => all_crypto_prices [i]}
    end
    #puts all_crypto[i].class #to be sure it is an hash
    
    puts all_crypto 
    return all_crypto
end


    merge_all_crypto(page)



  #puts all_crypto_names.size
  #puts all_crypto_names [0]
  #puts all_crypto_names [1]

  #puts all_crypto_prices.size
  #puts all_crypto_prices [0]
  #puts all_crypto_prices [1]

