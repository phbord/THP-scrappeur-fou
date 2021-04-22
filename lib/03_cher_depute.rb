require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

url_deputies = 'https://www.nosdeputes.fr/'

def deputies_str(url)
    begin
        client = Nokogiri::HTML(URI.open(url))
    rescue => e
        puts "Exception Message: #{ e.message }"
    end
    return client
end

def get_deputy(url)
    connect = deputies_str(url)
    p deputy = connect.css('.boite_depute ul[4] li[1] li[1] a').text
    return deputy
end

def get_deputies_list(url)
    deputies_hash = {}
    p deputies_row = deputies_str("#{url}deputes").css('.liste')
    return false if deputies_row.length < 1
    deputies_row.each.with_index { |n,i|
        #puts deputies_href = n.css('td.list_borderleft a .phototitle .urlphoto').attr('title')
        puts deputies_href = n.css('.urlphoto').attr('title')
        #p deputies_hash = n.css('list_nom')
    }
    # puts s
end

def perform(url)
    towns = deputies_str(url)
    #get_deputy("#{url}julien-aubert")
    get_deputies_list(url)
end

perform(url_deputies)