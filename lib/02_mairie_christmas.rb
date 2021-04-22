require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

email_url = 'https://www.annuaire-des-mairies.com/95/avernes.html'
townhall_urls = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
# table tbody tr[3] td table tbody tr td[2] p[2] object table tbody tr[2] td table tbody tr    td[1] p a[13]

def get_townhall_str(url)
    begin
        client = Nokogiri::HTML(open(url))
    rescue => e
        puts "Exception Message: #{ e.message }"
    end
    #puts client
    return client
end

def get_townhall_email(url)
    townhall_email_value = url.css('main section[2] div table tbody tr[4] td[2]').text.downcase
    return false if townhall_email_value.length < 1
    puts townhall_email_value
    return townhall_email_value
end

def get_townhall_urls(url)
    townhalls_row = url.css('table tbody tr[3] td table tbody tr td[2] p[2] object table tbody tr[2] td table tbody tr')
    return false if townhalls_row.length < 1
    puts townhalls_row
    return townhalls_row
end

def perform(url1, url2)
    url1 = get_townhall_str(url1)
    url2 = get_townhall_str(url2)
    #get_townhall_email(url2)
    get_townhall_urls(url1)
end

perform(townhall_urls, email_url)