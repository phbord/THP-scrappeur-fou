require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'pry'

def get_email(deputy_url)
    res_hash = {}
	page = Nokogiri::HTML(URI.open(deputy_url))
	email = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').text
	name = page.css('h1').text.split(' ')
    first_name = name[0]
    last_name = name[1]
	#puts "#{first_name} / #{last_name} / #{email}"
    res_hash = {"first_name" => first_name, "last_name" => last_name, "email" => email}
    return res_hash
end

def get_urls()
	doc = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))
	div_class = doc.xpath('//div[@class="list_table"]')
	all_a = div_class.css('a')
	all_urls = all_a.map { |element| urls = 'https://nosdeputes.fr'+element["href"] }
    res_arr = []
	all_urls.each { |url|
        p res_arr.push(get_email(url))
    }
    return res_arr
end

get_urls