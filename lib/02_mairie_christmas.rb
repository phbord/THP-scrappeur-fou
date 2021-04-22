require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

email_url = 'https://www.annuaire-des-mairies.com/'
townhall_urls = 'https://www.annuaire-des-mairies.com/val-d-oise.html'

def get_connexion_str(url)
    begin
        client = Nokogiri::HTML(URI.open(url))
    rescue => e
        puts "Exception Message: #{ e.message }"
    end
    #puts client
    return client
end

def get_townhall_email(url)
    townhall_email_value = url.css('main section[2] div table tbody tr[4] td[2]').text.downcase
    return false if townhall_email_value.length < 1
    #puts townhall_email_value
    return townhall_email_value
end

def get_townhall_urls(towns, url_email)
    townhalls_row = towns.css('a.lientxt')
    return false if townhalls_row.length < 1
    links = []
    townhalls_row.each.with_index { |n,i|
        url_end = n["href"]
        url_end = url_end.slice!(1..url_end.length - 1) if url_end.slice!(0) == '.'
        url_town = "#{url_email}#{url_end}"
        connexion = get_connexion_str(url_town)
        email = get_townhall_email(connexion)
        # hash incrementation
        links[i] = {n.text.upcase => email}
    }
    puts links
    return links
end

def perform(url_town, url_email)
    towns = get_connexion_str(url_town)
    get_townhall_urls(towns, url_email)
end

perform(townhall_urls, email_url)