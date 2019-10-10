require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)#pour trouver l'adresse mail d'une mairie à partir de son URL
    page = Nokogiri::HTML(open(townhall_url))
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()')
    email = email.to_s
    return email
end

def get_townhall_urls #pour choper chaque url des sites de mairies
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    array_url_ext = page.xpath('//a[@class="lientxt"]/@href')
    array_url_ext = array_url_ext.map {|url| url.to_s} #convert to a string
    array_url_ext = array_url_ext.map {|url| url = url[1..-1]} #suppression du . en premier caractère
    array_url_ext = array_url_ext.map {|url| url.prepend("http://annuaire-des-mairies.com")} # ajout du préfixe pour URL final
    return array_url_ext
end

def get_townhall_name(array_url_ext) #pour avoir le nom des villes
    array_townhall_name = array_url_ext
    array_townhall_name = array_townhall_name.map {|name| name[35..-6] }
    return array_townhall_name
end

def perform
    array_list_mail = []
    array_url_ext = get_townhall_urls
    for townhall_url in array_url_ext do townhall_url 
       array_list_mail << get_townhall_email(townhall_url) #fait tourner les url dans la fonction pour choper les mails + les mets dans un array avec des mails
    end
    array_townhall_name = get_townhall_name(array_url_ext)
    final_array = []
    for i in 0...array_townhall_name.size #fusion du final array contenant un hash
        final_array << {array_townhall_name[i] => array_list_mail[i]}
    end
return puts final_array

end

perform