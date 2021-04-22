require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

cryptos_hash = {}

def cryptos_str()
    begin
        client = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
    rescue => e
        puts "Exception Message: #{ e.message }"
    end
    return client
end

def get_cryptos(s, h)
    crypto_row = s.css('table tbody tr.cmc-table-row')
    return false if crypto_row.length < 1
    crypto_row.each { |n|
        name = n.css('td[3] div')
        price = n.css('td[5] div a')
        h.store(name.text.upcase, price.text)
        puts h
    }
    return h.uniq
end

def perform(s, h)
    s = s
    get_cryptos(s, h)
end

perform(cryptos_str, cryptos_hash)