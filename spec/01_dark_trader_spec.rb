require_relative '../lib/01_dark_trader'

describe "the array cryptos function" do
    it "should return a string" do
        expect(cryptos_arr).not_to be_nil
        expect(cryptos_arr).to be_a(Nokogiri::HTML::Document)
    end
end

describe "the get cryptos function" do
    it "should return an hash" do
        client = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
        expect(get_cryptos(client, {})).not_to be_nil
        expect(get_cryptos(client, {})).not_to be_empty
        expect(get_cryptos(client, {})).to be_a(Hash)
        expect(get_cryptos(client, {})).to have_key("BTC")
        expect(get_cryptos(client, {})).to have_key("ETH")
    end
end