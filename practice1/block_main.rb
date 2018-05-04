# encoding: utf-8
require 'sinatra'
require './block'
require 'json'

b = BlockChain.new
set :port, 1111
get '/' do
	message =""
	 b.all_chain.each do |a|
		message<<"번호" +a["index"].to_s + "<br>"
		message<<"nonce" +a["nonce"].to_s + "<br>"
		message<<"시간" +a["time"].to_s + "<br>"
		message<<"앞주소" +a["previous_address"].to_s + "<br>"
		message<<"내주소" + Digest::SHA256.hexdigest(a.to_s) + "<br>"
		message<<"거래 " + a['transaction'].to_s + "<br>"
		message<<"<hr>" 
	end
message
end

get '/mine' do
	b.mining.to_s
	#b.all_chain_length.to_s
end

get '/transaction' do
	#a가 b한테 보냈다! 일단 유효성 체크는 즈언혀 안할 것이다.
	#우리가 만들 트랜잭션은 
	# if params["sender"].nil?
	# 	"보내는사람 정보가 없습니다."
	# end
	"보내는 사람: "+ params["sender"]+"<br>"+"받는 사람: "+params["receiver"]
	b.trans(params["sender"],params["receiver"],params["amount"])
	#{}"거래가 완료되었습니다."
end

get '/makewallet' do
	b.make_wallet
	"지갑이 생성되었습니다."
end

get '/all_wallet' do
	b.show_all_wallet.to_s
end
#/transaction?sender =a&receiver=b &amount=1.1232
#데이터 간의 구분으 &표시로 한다. 

get '/total_blocks' do
	b.all_chain.size.to_s
	#장부가 서로 만났을때, 어떤 녀석이 서로 크냐 작냐를 생각할 때임.
end

get '/otherblocks' do
	b.get_other_blocks
end

get '/register' do
	b.add_node(params["node"])
end

get '/my_nodes' do
	b.total_nodes.to_s
end

get '/get_blocks' do
	new_blocks = JSON.parse(params["blocks"])
	# puts new_blocks
	b.add_new_blocks(new_blocks)
	b.all_chain.to_json
	#데이터를 POST 할 것이다.
end