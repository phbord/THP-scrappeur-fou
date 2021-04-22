require_relative '../lib/03_cher_depute'

describe "the hash get_email function" do
    it "should return a hash" do
        url = 'https://www.nosdeputes.fr/julien-aubert'
        expect(get_email(url)).not_to be_nil
        expect(get_email(url)).to be_a(Hash)
    end
end

describe "the array get_urls function" do
    it "should return a array" do
        expect(get_urls()).not_to be_nil
        expect(get_urls()).to be_a(Array)
    end
end