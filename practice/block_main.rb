require 'sinatra'
require './block'

b = BlockChain.new

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