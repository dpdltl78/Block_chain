require 'sinatra'
require './block'

b = BlockChain.new
set :port, 4568
get '/' do
	message =""
	 b.all_chain.each do |a|
		message<<"번호" +a["index"].to_s + "<br>"
		message<<"nonce" +a["nonce"].to_s + "<br>"
		message<<"시간" +a["time"].to_s + "<br>"
		message<<"앞주소" +a["previous_address"].to_s + "<br>"
		message<<"내주소" + Digest::SHA256.hexdigest(a.to_s) + "<br>"
		message<<"<hr>" 
	end
message
end

get '/mine' do
	b.mining.to_s
	#b.all_chain_length.to_s
end