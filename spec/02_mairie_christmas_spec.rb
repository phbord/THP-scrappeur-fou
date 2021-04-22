require_relative '../lib/02_mairie_christmas'

# describe "the array connexion function" do
#     it "should return a string" do
#         url = 'https://www.annuaire-des-mairies.com/95/avernes.html'
#         expect(get_connexion_str(url)).not_to be_nil
#         expect(get_connexion_str(url)).to be_a(Nokogiri::HTML::Document)
#     end
# end

# describe "the get get_townhall_email function" do
#     it "should return an array" do
#         client = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))
#         expect(get_townhall_email(client)).not_to be_nil
#         expect(get_townhall_email(client)).not_to be_empty
#         expect(get_townhall_email(client)).to be_a(String)
#         expect(get_townhall_email(client)).to eq("mairie.avernes@orange.fr")
#     end
# end

describe "the get get_townhall_email function" do
    it "should return an hash" do
        client = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))
        expect(get_townhall_email(client)).not_to be_nil
        expect(get_townhall_email(client)).not_to be_empty
        expect(get_townhall_email(client)).to be_a(String)
        expect(get_townhall_email(client)).to eq("mairie.avernes@orange.fr")
    end
end
