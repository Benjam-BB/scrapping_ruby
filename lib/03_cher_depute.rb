require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_depute_name(main_url)#pour trouver l'adresse mail d'une mairie à partir de son URL
    page = Nokogiri::HTML(open(main_url))
    fullname = []
    fullname = page.xpath('//*[@id="deputes-list"]/div/ul/li/a/text()')
    fullname = fullname.map {|depute| depute.to_s}
    #puts fullname[2]
    #puts fullname.size
    return fullname
end

def get_firstname(fullname)
    fullname = fullname.map {|depute| depute.downcase.split} #on met le nom du député dans un array dans l'array
    firstname = fullname.map {|depute| depute = depute[1]} #on récupère que le prénom
    #puts firstname[3]
    #puts firstname.size
    #puts firstname[1].class
    return firstname
end

def get_lastname(fullname)
    fullname = fullname.map {|depute| depute.downcase.split} #on met le nom du député dans un array dans l'array
    lastname = fullname.map {|depute| depute = depute[2..-1].join(' ')} #on récupère que le nom de famille
    lastname = lastname.flatten
    #puts lastname[3]
    #puts lastname.size
    #puts lastname[2].class
    return lastname
end
def get_email(firstname , lastname)
    depute_mail = []
    for i in 0...firstname.size
        depute_mail[i] = (firstname[i] + "." + lastname[i].delete(' ') + "@assemblee-nationale.fr")
    end
    depute_mail = depute_mail.map { |mail| mail.tr(
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz") }
    #puts depute_mail.size
    #puts depute_mail[500..575]
    return depute_mail
end

def full_identity (firstname, lastname, depute_mail)
    final_array = []
    for i in 0...firstname.size #fusion du final array contenant un hash
        final_array << {:first_name => firstname[i], :last_name => lastname[i], :email => depute_mail[i]}
    end
   return puts final_array
    
end
def perform
    main_url = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
    fullname = get_depute_name(main_url)
    firstname = get_firstname(fullname)
    lastname = get_lastname(fullname)
    depute_mail = get_email(firstname , lastname)
    full_identity(firstname, lastname, depute_mail)
end

perform
