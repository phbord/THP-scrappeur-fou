require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

def cryptos_arr()
    begin
        client = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    rescue => e
        puts "Exception Message: #{ e.message }"
    end
    puts client.class
    return client
end

cryptos_hash = {}

def get_cryptos(a, h)
    crypto_row = a.css('table tbody tr.cmc-table-row')
    return false if crypto_row.length < 1
    crypto_row.each { |n|
        name = n.css('td[3] div')
        price = n.css('td[5] div a')
        h.store(name.text.upcase, price.text)
        puts h
    }
    return h.uniq
end

def perform(a, h)
    a = a
    get_cryptos(a, h)
end

perform(cryptos_arr, cryptos_hash)