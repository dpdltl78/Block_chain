# encoding: UTF-8

require 'sinatra'
require './Blockchain'
#시나트라 라는 걸 쓰겠다!!!! 이 훌륭한 도구를 ㅆ겠다!!

#인스타가 이걸로 만들어졌다.  일단 대충 만들어보고 되나 안되나 확인용
#현존하는 웹프레임워크에서 제일빠르다.
#그다음은 파이썬 플라스크 >장고 /
#우리는 루비 시나트라 >레일즈 
a = Blockchain.new
get '/mine' do 
	'you mine a block' 
end
get '/frank-says'do
	'put this in your pipe & smoke it!'
end

get '/chorong'do
	'Sanguijung!'
end

get '/block_chain'do
	'70만원'
end

get '/block_first'do
	'4만원'
end

get '/block_first_2'do
	'8만원 '
end

get '/' do
	a.mining.to_s
end

get '/mining' do
	"지금 전체 블럭수는 :" +a.my_blocks.to_s
end